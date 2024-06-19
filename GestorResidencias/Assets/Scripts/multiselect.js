function pageLoad(sender, args) {
    jQuery("#cboxCEDISAcceso").multiselect({
        includeSelectAllOption: true,
        allSelectedText: 'Todos',
        selectAllNumber: false,
        buttonWidth: '100%',
        nonSelectedText: 'Seleccionar',
        selectAllText: 'Seleccionar todo',
        selectedClass: 'multiselect-selected',
        nSelectedText: ' - Seleccionados'
    });      
}

