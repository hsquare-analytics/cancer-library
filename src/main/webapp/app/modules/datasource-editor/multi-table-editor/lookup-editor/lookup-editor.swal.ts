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
    customClass: 'cancer-dialog',
    inputAttributes: {
      autocapitalize: 'off',
    },
    showCancelButton: true,
    confirmButtonText: 'Add',
    showLoaderOnConfirm: true,
  });
};

export const fireSaveCardSwal = () => {
  return Swal.fire({
    text: translate('cancerLibraryApp.datasource.lookupEditor.saveAlert'),
    // icon: 'warning',
    customClass: 'cancer-dialog',
    showCancelButton: true,
    confirmButtonColor: '#3085d6',
    cancelButtonColor: '#d33',
    confirmButtonText: translate('cancerLibraryApp.datasource.lookupEditor.confirmButtonText'),
    cancelButtonText: translate('cancerLibraryApp.datasource.lookupEditor.cancelButtonText'),
  });
};

export const fireDeleteCardSwal = () => {
  return Swal.fire({
    text: translate('cancerLibraryApp.datasource.lookupEditor.deleteAlert'),
    icon: 'warning',
    showCancelButton: true,
    confirmButtonColor: '#3085d6',
    cancelButtonColor: '#d33',
    confirmButtonText: translate('cancerLibraryApp.datasource.lookupEditor.confirmButtonText'),
    cancelButtonText: translate('cancerLibraryApp.datasource.lookupEditor.cancelButtonText'),
  });
};
