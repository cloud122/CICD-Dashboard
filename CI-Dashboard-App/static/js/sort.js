$(document).ready(function () {
  $(".sortable").on("click", function () {
    const table = $(this).parents("table").eq(0);
    const rows = table.find("tr:gt(0)").toArray().sort(comparator($(this).data("column")));
    this.asc = !this.asc;
    if (!this.asc) {
      rows.reverse();
    }
    for (let i = 0; i < rows.length; i++) {
      table.append(rows[i]);
    }

    // Toggle sorting indicator classes
    $(".sortable").removeClass("sorted-asc sorted-desc");
    $(this).addClass(this.asc ? "sorted-asc" : "sorted-desc");
  });

  function comparator(index) {
    return function (a, b) {
      const valA = getCellValue(a, index);
      const valB = getCellValue(b, index);
      return $.isNumeric(valA) && $.isNumeric(valB)
        ? valA - valB
        : valA.toString().localeCompare(valB);
    };
  }

  function getCellValue(row, index) {
    return $(row).children("td").eq(index).text();
  }
});