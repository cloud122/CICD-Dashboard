document.addEventListener('DOMContentLoaded', function() {
// Function to perform table filtering
function filterTable(tableId, inputId) {
  const searchInput = document.getElementById(inputId);
  const table = document.getElementById(tableId);
  const rows = table.getElementsByTagName('tr');

  searchInput.addEventListener('keyup', function () {
    const searchText = searchInput.value.toLowerCase();

    for (let i = 1; i < rows.length; i++) {
      const row = rows[i];
      const cells = row.getElementsByTagName('td');
      let found = false;

      for (let j = 0; j < cells.length; j++) {
        const cell = cells[j];
        const cellText = cell.textContent.toLowerCase();

        if (cellText.indexOf(searchText) > -1) {
          found = true;
          break;
        }
      }

      if (found) {
        row.style.display = '';
      } else {
        row.style.display = 'none';
      }
    }
  });
}

// Call the filterTable function for each table
filterTable('testtable1', 'searchInput');
filterTable('testtable2', 'searchInput');
// Add more tables and input fields as needed

});
