function pageLoad(sender, args) {

    jQuery("#lboxSistema").multiselect({
        includeSelectAllOption: true,
        buttonWidth: '100%',
        allSelectedText: 'Todos',
        nonSelectedText: 'Seleccionar',
        selectAllNumber: false,
        selectAllText: 'Seleccionar todo',
        selectedClass: 'multiselect-selected',
        nSelectedText: ' - Seleccionados',
        templates: {
            button: '<button type="button" id="Sistema" class="multiselect dropdown-toggle" data-toggle="dropdown"><span class="multiselect-selected-text"></span> <b class="caret"></b></button>'
        }
    });
    jQuery("#lboxEstandar").multiselect({
        includeSelectAllOption: true,
        buttonWidth: '100%',
        allSelectedText: 'Todos',
        selectAllNumber: false,
        nonSelectedText: 'Selecccionar',
        selectAllText: 'Seleccionar todo',
        selectedClass: 'multiselect-selected',
        nSelectedText: ' - Seleccionados',
        templates: {
            button: '<button type="button" id="Estandar" class="multiselect dropdown-toggle" data-toggle="dropdown"><span class="multiselect-selected-text"></span> <b class="caret"></b></button>'
        }
    });

    jQuery("#cboxareas").multiselect({
        includeSelectAllOption: true,
        buttonWidth: '100%',
        nonSelectedText: 'Seleccionar',
        selectAllNumber: false,
        selectAllText: 'Seleccionar todo',
        selectedClass: 'multiselect-selected',
        allSelectedText: 'Todos',
        nSelectedText: ' - Seleccionados',
        templates: {
            button: '<button type="button" id="Areas" class="multiselect dropdown-toggle" data-toggle="dropdown"><span class="multiselect-selected-text"></span> <b class="caret"></b></button>'
        }
    });

    jQuery("#lboxdeptos").multiselect({
        includeSelectAllOption: true,
        buttonWidth: '100%',
        nonSelectedText: 'Seleccionar',
        selectAllNumber: false,
        selectAllText: 'Seleccionar todo',
        selectedClass: 'multiselect-selected',
        allSelectedText: 'Todos',
        nSelectedText: ' - Seleccionados',
        templates: {
            button: '<button type="button" id="Deptos" class="multiselect dropdown-toggle" data-toggle="dropdown"><span class="multiselect-selected-text"></span> <b class="caret"></b></button>'
        }
    });


}
     //jQuery("#Sistema").attr('disabled', 'disabled');
    //jQuery("#Estandar").attr('disabled', 'disabled');
    //jQuery("#Areas").attr('disabled', 'disabled');
    //jQuery("#Deptos").attr('disabled', 'disabled');

    //$(document).ready(function () {

    //    $('#<%=Txtnombredoc.ClientID%>').change(function () {
    //        if (this.value != '') {
    //            jQuery("#Sistema").removeAttr('disabled');
    //            jQuery("#Estandar").removeAttr('disabled');
    //            jQuery("#Areas").removeAttr('disabled');
    //            jQuery("#Deptos").removeAttr('disabled');
    //        }
    //        else {
    //            jQuery("#Sistema").attr('disabled', 'disabled');
    //            jQuery("#Estandar").attr('disabled', 'disabled');
    //            jQuery("#Areas").attr('disabled', 'disabled');
    //            jQuery("#Deptos").attr('disabled', 'disabled');

    //        }
    //    });

    //});

