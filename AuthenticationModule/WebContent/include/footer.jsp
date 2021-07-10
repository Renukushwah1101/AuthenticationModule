<!--  End Modal -->
<footer class="footer" style="background-image: linear-gradient(to top, #000000, #060203, #0b0305, #100506, #140708, #140708, #140708, #140708, #100506, #0b0305, #060203, #000000);">
    <div class="container-flod">
        <div class="row">
            
            <div class="col-lg-12 col-sm-12 col-md-12 text-center text-white">
                <br> <p> Created by : RenuKushwah & MuskanVarshney </p>
                
<a href ="https://www.linkedin.com/feed/"><i class=" social-icon fab fa-linkedin"></i></a>
<a href="https://www.instagram.com/"><i class=" social-icon fab fa-instagram"></i></a>
                <p>AuthenticationModule</p>
                <p>@ 2021 - All Right Reserved</p>
            </div>
            
            
        </div>

    </div>
</footer>
<!--   Core JS Files   -->
<script src="./assets/js/core/jquery.3.2.1.min.js" type="text/javascript"></script>
<script src="./assets/js/core/popper.min.js" type="text/javascript"></script>
<script src="./assets/js/core/bootstrap.min.js" type="text/javascript"></script>
<!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
<script src="./assets/js/plugins/bootstrap-switch.js"></script>
<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
<script src="./assets/js/plugins/nouislider.min.js" type="text/javascript"></script>
<!--  Plugin for the DatePicker, full documentation here: https://github.com/uxsolutions/bootstrap-datepicker -->
<script src="./assets/js/plugins/bootstrap-datepicker.js" type="text/javascript"></script>
<!-- Control Center for Now Ui Kit: parallax effects, scripts for the example pages etc -->
<script src="./assets/js/now-ui-kit.js?v=1.1.0" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function () {
        // the body of this function is in assets/js/now-ui-kit.js
        nowuiKit.initSliders();
    });

    function scrollToDownload() {

        if ($('.section-download').length != 0) {
            $("html, body").animate({
                scrollTop: $('.section-download').offset().top
            }, 1000);
        }
    }
</script>