// dashboard.js
$(document).ready(function() {
    const configTable = {
        ajax: {
            url: '/api/transactions.php',
            dataSrc: 'data'
        },
        columns: [
            { data: 'fecha' },
            { data: 'monto', render: $.fn.dataTable.render.number(',', '.', 2, '$') },
            { data: 'proveedor' }
        ]
    };

    $('#tablaIngresos').DataTable({
        ...configTable,
        initComplete: function() {
            this.api().page.len(25).draw();
        }
    });
});