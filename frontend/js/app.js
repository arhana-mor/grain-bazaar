
const API = 'http://localhost:3001/api';

let selectedListing = null;
let currentFarmerId = null;
let grainList = [];

async function apiFetch(path, options = {}){
const res = await fetch(API + path,{
headers:{
'Content-Type':'application/json'
},
...options
});

if(!res.ok){
const err = await res.json().catch(function(){
return {error:res.statusText};
});
throw new Error(err.error || 'Request failed');
}

return res.json();
}

async function goTo(id){
document.querySelectorAll('.screen').forEach(function(screen){
screen.classList.remove('active');
});

document.getElementById(id).classList.add('active');

if(id == 'screen-customer'){
await initCustomerScreen();
}

if(id == 'screen-farmer'){
await initFarmerScreen();
}
}

async function initCustomerScreen(){
try{
const farmers = await apiFetch('/farmers');
const grains = await apiFetch('/grains');

grainList = grains;

const grainSelect = document.getElementById('cust-grain');
grainSelect.innerHTML = '<option value="">Any grain</option>';

grains.forEach(function(grain){
const option = document.createElement('option');
option.value = grain.GRAIN_NAME;
option.textContent = grain.GRAIN_NAME;
grainSelect.appendChild(option);
});

const farmerSelect = document.getElementById('cust-farmer');
farmerSelect.innerHTML = '<option value="">Any farmer</option>';

farmers.forEach(function(farmer){
const option = document.createElement('option');
option.value = farmer.FARMER_ID;
option.textContent = farmer.FIRST_NAME + ' ' + farmer.LAST_NAME;
farmerSelect.appendChild(option);
});
}
catch(error){
showToast('Could not load data: ' + error.message);
}
}

async function initFarmerScreen(){
try{
const farmers = await apiFetch('/farmers');
const grains = await apiFetch('/grains');

grainList = grains;

const farmerSelect = document.getElementById('farmer-select');
farmerSelect.innerHTML = '<option value="">— choose —</option>';

farmers.forEach(function(farmer){
const option = document.createElement('option');
option.value = farmer.FARMER_ID;
option.textContent = farmer.FIRST_NAME + ' ' + farmer.LAST_NAME;
farmerSelect.appendChild(option);
});

const grainSelect = document.getElementById('new-grain');
grainSelect.innerHTML = '';

grains.forEach(function(grain){
const option = document.createElement('option');
option.value = grain.GRAIN_ID;
option.textContent = grain.GRAIN_NAME;
grainSelect.appendChild(option);
});
}
catch(error){
showToast('Could not load data: ' + error.message);
}
}

async function runCustomerSearch(){
const grain_name = document.getElementById('cust-grain').value || null;
const max_price = parseFloat(document.getElementById('cust-maxprice').value) || null;
const farmer_id = document.getElementById('cust-farmer').value || null;
const quantity = parseInt(document.getElementById('cust-qty').value) || null;
const container = document.getElementById('customer-results');

container.innerHTML = 'Searching...';

try{
const data = await apiFetch('/find-farmers',{
method:'POST',
body:JSON.stringify({
grain_name:grain_name,
quantity:quantity,
max_price:max_price,
farmer_id:farmer_id
})
});

if(data.rows.length > 0){
let html = '<div class="section-label">Available now</div>';

data.rows.forEach(function(row){
html +=
'<div class="result-card">' +
'<div>' +
'<h4>' + row.FIRST_NAME + ' ' + row.LAST_NAME + '</h4>' +
'<p>' + row.GRAIN_NAME + ' · Available: ' + row.QUANTITY_AVAILABLE + ' units</p>' +
'<p>Phone: ' + row.FARMER_PHONE + '</p>' +
(row.AVG_PAST_PRICE ?
'<p>Historical avg: ₹' + row.AVG_PAST_PRICE + '/unit</p>' : '') +
'</div>' +
'<div>' +
'<div class="price">₹' + row.PRICE_PER_UNIT + '</div>' +
'<div>per unit</div>' +
'<button class="buy-btn" onclick="customerBuy(\'' + row.FARMER_ID + '\',\'' + row.FARMER_PHONE + '\')">Buy</button>' +
'</div>' +
'</div>';
});

container.innerHTML = html;
}
else{
const past = await apiFetch('/past-sellers',{
method:'POST',
body:JSON.stringify({
grain_name:grain_name,
max_price:max_price,
farmer_id:farmer_id
})
});

if(past.rows.length > 0){
let html =
'<div class="alert-box">' +
'No farmers currently have this available. Here are sellers who had it in the past.' +
'</div>';

html += '<div class="section-label">Past sellers</div>';

past.rows.forEach(function(row){
html +=
'<div class="result-card">' +
'<div>' +
'<h4>' + row.FIRST_NAME + ' ' + row.LAST_NAME + '</h4>' +
'<p>' + row.GRAIN_NAME + ' · Past seller</p>' +
'<p>Phone: ' + row.FARMER_PHONE + '</p>' +
'</div>' +
'<div>';

if(row.AVG_PAST_PRICE){
html +=
'<div class="price">₹' + row.AVG_PAST_PRICE + '</div>' +
'<div>avg past price</div>';
}

html += '</div></div>';
});

container.innerHTML = html;
}
else{
container.innerHTML =
'<div class="empty-state">' +
'<p>No results found. Try relaxing your filters.</p>' +
'</div>';
}
}
}
catch(error){
container.innerHTML =
'<div class="alert-box">' +
'Error: ' + error.message +
'</div>';
}
}

function customerBuy(farmer_id, phone){
alert('The phone number of ' + farmer_id + ' farmer is ' + phone);
}

async function loadFarmerDashboard(){
currentFarmerId = document.getElementById('farmer-select').value || null;
const dashboard = document.getElementById('farmer-dashboard');

if(!currentFarmerId){
dashboard.style.display = 'none';
return;
}

dashboard.style.display = 'block';
switchTab('listings');
}

function switchTab(tab){
const tabs = ['listings','add','transactions'];

document.querySelectorAll('.tab').forEach(function(tabElement,index){
if(tabs[index] == tab){
tabElement.classList.add('active');
}
else{
tabElement.classList.remove('active');
}
});

tabs.forEach(function(tabName){
const element = document.getElementById('tab-' + tabName);

if(tabName == tab){
element.style.display = 'block';
}
else{
element.style.display = 'none';
}
});

if(tab == 'listings'){
renderListings();
}

if(tab == 'transactions'){
renderTransactions();
}
}

async function renderListings(){
const container = document.getElementById('tab-listings');
container.innerHTML = 'Loading...';

try{
const rows = await apiFetch('/farmer/' + currentFarmerId + '/listings');

if(!rows.length){
container.innerHTML =
'<div class="empty-state">' +
'<p>No listings yet. Use "Add Listing" to create one.</p>' +
'</div>';
return;
}

let html = '';

rows.forEach(function(listing){
const active = listing.STATUS == 'active';

html +=
'<div class="listing-card">' +
'<p>' +
listing.GRAIN_NAME +
' ' +
'<span class="badge ' + (active ? 'badge-green' : 'badge-gray') + '">' +
(active ? 'Active' : 'Sold out') +
'</span>' +
'</p>' +
'<p>' + listing.QUANTITY_AVAILABLE + ' units · ₹' + listing.PRICE_PER_UNIT + '/unit</p>' +
'<div class="listing-card-actions">';

if(active){
html +=
'<button class="action-btn" onclick="openMarkSold(' +
listing.LISTING_ID +
',\'' +
listing.GRAIN_NAME +
'\',' +
listing.GRAIN_ID +
',' +
listing.PRICE_PER_UNIT +
')">Mark as sold</button>';
}

html +=
'<button class="action-btn danger" onclick="removeListing(' +
listing.LISTING_ID +
')">Remove</button>' +
'</div>' +
'</div>';
});

container.innerHTML = html;
}
catch(error){
container.innerHTML =
'<div class="alert-box">' +
'Error: ' + error.message +
'</div>';
}
}

async function renderTransactions(){
const container = document.getElementById('tab-transactions');
container.innerHTML = 'Loading...';

try{
const rows = await apiFetch('/farmer/' + currentFarmerId + '/transactions');

if(!rows.length){
container.innerHTML =
'<div class="empty-state">' +
'<p>No transactions recorded yet.</p>' +
'</div>';
return;
}

let html = '<div class="section-label">Transaction history</div>';

rows.forEach(function(transaction){
let customer = transaction.CUSTOMER_NAME;

if(!customer){
customer = 'ID: ' + (transaction.CUSTOMER_ID || '—');
}

html +=
'<div class="result-card">' +
'<div>' +
'<h4>' + transaction.GRAIN_NAME + '</h4>' +
'<p>Customer: ' + customer + '</p>' +
'<p>' +
transaction.QUANTITY +
' units · ' +
new Date(transaction.TRANS_DATE).toLocaleDateString('en-IN') +
'</p>' +
'</div>' +
'<div>' +
'<div class="price">₹' + transaction.PRICE_PER_UNIT + '</div>' +
'<div>per unit</div>' +
'</div>' +
'</div>';
});

container.innerHTML = html;
}
catch(error){
container.innerHTML =
'<div class="alert-box">' +
'Error: ' + error.message +
'</div>';
}
}

async function addListing(){
const grain = document.getElementById('new-grain');
const grain_id = grain.value;
const grain_name = grain.selectedOptions[0].text;
const quantity = parseInt(document.getElementById('new-qty').value);
const price = parseInt(document.getElementById('new-price').value);

if(!quantity || !price || quantity < 1 || price < 1){
showToast('Please enter quantity and price.');
return;
}

try{
await apiFetch('/listing',{
method:'POST',
body:JSON.stringify({
farmer_id:currentFarmerId,
grain_id:grain_id,
quantity:quantity,
price:price
})
});

document.getElementById('new-qty').value = '';
document.getElementById('new-price').value = '';

showToast(
'Listing added: ' +
grain_name +
' — ' +
quantity +
' units at ₹' +
price +
'/unit'
);

switchTab('listings');
}
catch(error){
showToast('Error: ' + error.message);
}
}

async function removeListing(id){
try{
await apiFetch('/listing/' + id,{
method:'DELETE'
});

showToast('Listing removed.');
renderListings();
}
catch(error){
showToast('Error: ' + error.message);
}
}

function openMarkSold(listing_id,grain_name,grain_id,price){
selectedListing = {
listing_id:listing_id,
grain_name:grain_name,
grain_id:grain_id,
price:price
};

document.getElementById('ms-customer').value = '';
document.getElementById('ms-qty').value = '';
document.getElementById('ms-price').value = price;

document.getElementById('modal-marksold').classList.add('open');
}

function closeModal(){
document.getElementById('modal-marksold').classList.remove('open');
selectedListing = null;
}

async function confirmSold(){
const customer_id = document.getElementById('ms-customer').value.trim();
const qty = parseInt(document.getElementById('ms-qty').value);
const price = parseInt(document.getElementById('ms-price').value);

if(!customer_id || !qty || !price){
showToast('Please fill all fields.');
return;
}

try{
const result = await apiFetch('/transaction',{
method:'POST',
body:JSON.stringify({
farmer_id:currentFarmerId,
customer_id:customer_id,
grain_id:selectedListing.grain_id,
quantity:qty,
price:price
})
});

if(result.success){
closeModal();

showToast(
'Transaction recorded: ' +
qty +
' units at ₹' +
price +
'/unit'
);

switchTab('transactions');
}
else{
showToast('Error: ' + result.error);
}
}
catch(error){
showToast('Error: ' + error.message);
}
}

function showToast(msg){
const toast = document.getElementById('toast');
toast.textContent = msg;
toast.style.display = 'block';

setTimeout(function(){
toast.style.display = 'none';
},3000);
}

