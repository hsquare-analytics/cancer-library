import Swal from 'sweetalert2';
import $ from 'jquery';
import {translate} from 'react-jhipster';

export const fireAddCardSwal = () => {
  return Swal.fire({
    html:
      `<div style="white-space:nowrap">
          <label for="swal-input1">label:</label>
          <input id="swal-input1" class="swal2-input" required>
        </div>` +
      `<div style="white-space:nowrap">
          <label for="swal-input2">value:</label>
          <input id="swal-input2" class="swal2-input" required/>
        </div>`,
    preConfirm() {
      return {
        title: $('#swal-input1').val(),
        description: $('#swal-input2').val(),
      };
    },
    inputAttributes: {
      autocapitalize: 'off'
    },
    showCancelButton: true,
    confirmButtonText: 'Add',
    showLoaderOnConfirm: true,
  });
};

export const fireSaveCardSwal = () => {
  return Swal.fire({
    text: translate('cancerLibraryApp.datasourceEditor.lookupEditor.saveAlert'),
    icon: 'warning',
    showCancelButton: true,
    confirmButtonColor: '#3085d6',
    cancelButtonColor: '#d33',
    confirmButtonText: translate('cancerLibraryApp.datasourceEditor.lookupEditor.confirmButtonText'),
    cancelButtonText: translate('cancerLibraryApp.datasourceEditor.lookupEditor.cancelButtonText'),
  });
}

export const fireDeleteCardSwal = () => {
  return Swal.fire({
    text: translate('cancerLibraryApp.datasourceEditor.lookupEditor.deleteAlert'),
    icon: 'warning',
    showCancelButton: true,
    confirmButtonColor: '#3085d6',
    cancelButtonColor: '#d33',
    confirmButtonText: translate('cancerLibraryApp.datasourceEditor.lookupEditor.confirmButtonText'),
    cancelButtonText: translate('cancerLibraryApp.datasourceEditor.lookupEditor.cancelButtonText'),
  });
};
