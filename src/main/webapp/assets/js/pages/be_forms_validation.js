/*
 *  Document   : be_forms_validation.js
 *  Author     : pixelcave
 *  Description: Custom JS code used in Form Validation Page
 */

var BeFormValidation = function() {
    // Init Bootstrap Forms Validation, for more examples you can check out https://github.com/jzaefferer/jquery-validation
    var initValidationBootstrap = function(){
        jQuery('.js-validation-bootstrap').validate({
            ignore: [],
            errorClass: 'invalid-feedback animated fadeInDown',
            errorElement: 'div',
            errorPlacement: function(error, e) {
                jQuery(e).parents('.form-group > div').append(error);
            },
            highlight: function(e) {
                jQuery(e).closest('.form-group').removeClass('is-invalid').addClass('is-invalid');
            },
            success: function(e) {
                jQuery(e).closest('.form-group').removeClass('is-invalid');
                jQuery(e).remove();
            },
            rules: {
            	'val-userid' : {
            		required: true,
            		minlength: 4,
            		maxlength: 12
            	},
                'val-username': {
                    required: true,
                    minlength: 2
                },
                'val-email': {
                    required: true,
                    email: true
                },
                'val-password': {
                    required: true,
                    minlength: 5
                },
                'val-confirm-password': {
                    required: true,
                    equalTo: '#val-password'
                },
                'val-select2': {
                    required: true
                },
                'val-select2-multiple': {
                    required: true,
                    minlength: 2
                },
                'val-suggestions': {
                    required: true,
                    minlength: 5
                },
                'val-skill': {
                    required: true
                },
                'val-currency': {
                    required: true,
                    currency: ['$', true]
                },
                'val-website': {
                    required: true,
                    url: true
                },
                'val-phoneus': {
                    required: true,
                },
                'val-digits': {
                    required: true,
                    digits: true
                },
                'val-number': {
                    required: true,
                    number: true
                },
                'val-range': {
                    required: true,
                    range: [1, 5]
                },
                'val-terms': {
                    required: true
                },
                'ftype_num': {
                	required: true
                },
                'mtype_num': {
                	required: true
                },
                'val-bir': {
                	required: true
                },
                'add1':{
                	required: true
                }
            },
            messages: {
            	'val-userid' : {
            		required: '아이디를 입력해주세요.',
            		minlength : '4글자 이상 입력해주세요.',
            		maxlength : '12글자 이하로 입력해주세요.'
            	},
                'val-username': {
                    required: '이름을 입력해주세요.',
                    minlength: '2글자 이상의 올바른 이름을 입력해주세요.'
                },
                'val-email': {
                	required : '이메일을 입력해주세요.',
                	email : '이메일을 올바르게 입력해주세요.'
                },
                'val-password': {
                    required: '비밀번호를 입력해주세요.',
                    minlength: '5글자 이상 입력해주세요.'
                },
                'val-confirm-password': {
                    required: '비밀번호를 확인해주세요.',
                    minlength: '위의 비밀번호와 같게 입력해주세요.',
                    equalTo: '위의 비밀번호와 같게 입력해주세요.'
                },
                'val-phoneus': {
                	required: '전화번호를 입력해주세요.',
                },
                'ftype_num' :{
                	required: '개발분야를 선택해주세요.'
                },
                'mtype_num' :{
                	required: '사업자 유형을 선택해주세요.'
                },
                'val-bir': {
                	required: '생년월일을 바르게 입력해주세요.'
                },
                'add1':{
                	required: '주소를 입력해주세요.'
                },
                'val-select2': '값을 선택해주세요.',
                'val-select2-multiple': '최소2개 이상 선택해주세요.',
                'val-suggestions': 'What can we do to become better?',
                'val-skill': 'Please select a skill!',
                'val-currency': 'Please enter a price!',
                'val-website': 'Please enter your website!',
                'val-digits': 'Please enter only digits!',
                'val-number': 'Please enter a number!',
                'val-range': 'Please enter a number between 1 and 5!',
                'val-terms': '동의해야 가입하실 수 있습니다.'
            }
        });
    };

    return {
        init: function () {
            // Init Bootstrap Forms Validation
            initValidationBootstrap();

            // Init Validation on Select2 change
            jQuery('.js-select2').on('change', function(){
                jQuery(this).valid();
            });
        }
    };
}();

// Initialize when page loads
jQuery(function(){ BeFormValidation.init(); });
