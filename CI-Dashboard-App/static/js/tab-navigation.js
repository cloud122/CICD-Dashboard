// tab-navigation.js

// JavaScript event listeners for the tab links
document.addEventListener('DOMContentLoaded', function() {
       function openTab(tabId) {
        // Remove the "active" class from all tab links
        var tabLinks = document.querySelectorAll('.nav-link');
        tabLinks.forEach(function(link) {
            link.classList.remove('active');
        });

        // Add the "active" class to the specific tab link
        var tabLink = document.getElementById(tabId + '-tab');
        tabLink.classList.add('active');

        // Remove the "active" class from all tab contents
        var tabContents = document.querySelectorAll('.tab-pane');
        tabContents.forEach(function(content) {
            content.classList.remove('active', 'show');
        });

        // Add the "active" class to the specific tab content
        var tabContent = document.getElementById(tabId);
        tabContent.classList.add('active', 'show');
    }
    
    var table1TabLink = document.getElementById('table1-tab');
    var table2TabLink = document.getElementById('table2-tab');
    var table3TabLink = document.getElementById('table3-tab');
    var table4TabLink = document.getElementById('table4-tab');
    var table5TabLink = document.getElementById('table5-tab');
    var table6TabLink = document.getElementById('table6-tab');

    table1TabLink.addEventListener('click', function() {
        openTab('table1');
    });

    table2TabLink.addEventListener('click', function() {
        openTab('table2');
    });
    table3TabLink.addEventListener('click', function() {
        openTab('table3');
    });
    table4TabLink.addEventListener('click', function() {
        openTab('table4');
    });
    table5TabLink.addEventListener('click', function() {
        openTab('table5');
    });
    table6TabLink.addEventListener('click', function() {
        openTab('table6');
    });

    // Function to remember the active tab
function rememberActiveTab(tabId) {
  localStorage.setItem('activeTab', tabId);
}

// Function to retrieve and set the active tab on page load/refresh
function setActiveTab() {
  const activeTabId = localStorage.getItem('activeTab');
  if (activeTabId) {
    const activeTab = document.getElementById(activeTabId);
    if (activeTab) {
      activeTab.click();
    }
  }
}

// Add event listeners to tabs to remember the active tab
const tabs = document.querySelectorAll('.nav-link');
tabs.forEach(tab => {
  tab.addEventListener('click', function() {
    rememberActiveTab(tab.id);
  });
});

// Set the active tab when the page is loaded or refreshed
window.addEventListener('load', setActiveTab);

});