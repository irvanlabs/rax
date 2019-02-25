
jQuery(document).ready(function() {

    /*
        Background slideshow
    */
    // $('.coming-soon').backstretch([
    //   "assets/img/backgrounds/1.jpg"
    // , "assets/img/backgrounds/2.jpg"
    // , "assets/img/backgrounds/3.jpg"
    // ], {duration: 3000, fade: 750});

    // Script Hitung Mundur
    var date = $('#deadline').data('date');
        $('#deadline').countdown(date, function(event) {
            var $this = $(this).html(event.strftime(''
                + '<div class="days-wrapper"><span class="days">%w</span> <br>Minggu</div>'
                + '<div class="days-wrapper"><span class="days">%d</span> <br>Hari</div>'
                + '<div class="hours-wrapper"><span class="hours">%H</span> <br>Jam</div>'
                + '<div class="minutes-wrapper"><span class="minutes">%M</span> <br>Menit</div>'
                + '<div class="seconds-wrapper"><span class="seconds">%S</span> <br>Detik</div>'));
        });
    /*
        Subscription form
    */
    $('.subscribe form').submit(function(e) {
    	e.preventDefault();
        var postdata = $('.subscribe form').serialize();
        $.ajax({
            type: 'POST',
            url: 'assets/subscribe.php',
            data: postdata,
            dataType: 'json',
            success: function(json) {
                if(json.valid == 0) {
                    $('.success-message').hide();
                    $('.error-message').hide();
                    $('.error-message').html(json.message);
                    $('.error-message').fadeIn();
                }
                else {
                    $('.error-message').hide();
                    $('.success-message').hide();
                    $('.subscribe form').hide();
                    $('.success-message').html(json.message);
                    $('.success-message').fadeIn();
                }
            }
        });
    });

});
