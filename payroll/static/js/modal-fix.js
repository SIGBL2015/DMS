// /**
//  * Modal Fix for Bootstrap 4.0.0-beta.3
//  * This script fixes issues with modal backdrops and stacking
//  */

// (function($) {
//     'use strict';
    
//     // Function to remove modal backdrops and reset body styles
//     function fixModals() {
//         // Remove all modal backdrops
//         $('.modal-backdrop').remove();
        
//         // Remove modal-open class from body
//         $('body').removeClass('modal-open');
        
//         // Reset body padding and overflow
//         $('body').css({
//             'padding-right': '',
//             'overflow': ''
//         });
//     }
    
//     // Function to handle modal stacking
//     function handleModalStacking() {
//         var zIndex = 1040;
//         $('.modal:visible').each(function() {
//             $(this).css('z-index', zIndex);
//             zIndex += 10;
//         });
        
//         $('.modal-backdrop').each(function() {
//             $(this).css('z-index', zIndex - 1);
//         });
//     }
    
//     // Apply fixes when document is ready
//     $(document).ready(function() {
//         // Initial cleanup
//         fixModals();
        
//         // Handle modal events
//         $('.modal').on('show.bs.modal', function() {
//             handleModalStacking();
//         });
        
//         $('.modal').on('hidden.bs.modal', function() {
//             // Ensure backdrop is removed
//             $('.modal-backdrop').remove();
//             $('body').removeClass('modal-open');
//             $('body').css('padding-right', '');
            
//             // If there are still visible modals, keep modal-open class
//             if ($('.modal:visible').length > 0) {
//                 $('body').addClass('modal-open');
//             }
//         });
        
//         // Handle Select2 in modals
//         $('.modal').on('shown.bs.modal', function() {
//             $(this).find('select').select2({
//                 dropdownParent: $(this),
//                 width: '100%'
//             });
//         });
        
//         // Handle form validation
//         $('.modal form').on('submit', function(e) {
//             if (!this.checkValidity()) {
//                 e.preventDefault();
//                 e.stopPropagation();
//             }
//             $(this).addClass('was-validated');
//         });
        
//         // Handle escape key
//         $(document).on('keydown', function(e) {
//             if (e.keyCode === 27) { // Escape key
//                 $('.modal.show').modal('hide');
//             }
//         });
        
//         // Fix for modal close buttons
//         $('.modal .close, .modal .btn-close').on('click', function() {
//             $(this).closest('.modal').modal('hide');
//         });
        
//         // Fix for data-dismiss="modal" buttons
//         $('[data-dismiss="modal"]').on('click', function() {
//             $(this).closest('.modal').modal('hide');
//         });
//     });
    
//     // Expose the fix function globally
//     window.fixModals = fixModals;
    
// })(jQuery); 