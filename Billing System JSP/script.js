// Retrieve the session storage data
var sessionData = window.sessionStorage;
var cartItems = Object.keys(sessionData);

// Get a reference to the table element
var table = document.getElementById("TABLE");

// Create the table header
var headerRow = table.rows[0];

var actionHeader = document.createElement("th");
actionHeader.innerHTML = "Actions";
headerRow.appendChild(actionHeader);

var ttlPrice = 0;

// Add the cart items to the table
for (var i = 0; i < cartItems.length; i++) {
    var item = JSON.parse(sessionData.getItem(cartItems[i]));
    var row = table.insertRow();
    var idCell = row.insertCell(0);
    idCell.innerHTML = cartItems[i];
    var priceCell = row.insertCell(1);
    priceCell.innerHTML = item.price;
    var countCell = row.insertCell(2);
    countCell.innerHTML = item.count;
    var actionsCell = row.insertCell(3);
    actionsCell.innerHTML = '<button onclick="alterCount(' + cartItems[i] + ')">Alter Count</button>&nbsp;<button onclick="deleteItem(' + cartItems[i] + ')">Delete</button>';
    ttlPrice += Number(item.price) * Number(item.count);
}

document.getElementById("TP").innerHTML = `The Total Cart Amount = ${ttlPrice} $`;


function alterCount(id) {
    var count = prompt("Enter new count:");
    if (isNaN(count) || count < 0) {
        alert("Invalid Count Value");
        return;
    }
    var Item = JSON.parse(sessionData.getItem(id));
    var arr = {
        price: Item.price,
        count: count
    };
    window.sessionStorage.setItem(id, JSON.stringify(arr));
    alert("Count Changed");
    location.reload();
}

function deleteItem(id) {
    var confirmed = confirm("Are you sure you want to remove this item from the cart?");
    if (confirmed) {
        window.sessionStorage.removeItem(id);
        alert("Item removed from cart");
        location.reload();
    }
}

function checkout(){
    alert("Thank you for shopping!");
    sessionStorage.clear();
    window.location.href="home.jsp";
}
