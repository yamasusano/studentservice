<?php
/**
 * Template Name: Profile Template.
 */
require 'includes/core/is-user-login.php';
include 'includes/core/profile/gpf-student-profile.php';
get_header();

?>
<div class="container">
    <div id="main-wrapper" class="zozo-row row">
        <div id="single-sidebar-container" class="single-sidebar-container <?php zozo_content_sidebar_classes(); ?>">
            <div class="zozo-row row">
                <div id="primary" class="content-area <?php zozo_primary_content_classes(); ?>">
                    <div id="content" class="site-content">
                        <div class="container"></b>
                            <div class="row profile">
                                <div class="col-md-3">
                                    <div class="profile-sidebar">
                                        <!-- SIDEBAR USERPIC -->
                                        <div class="profile-userpic">
                                                <?php custom_update_avatar(); ?>
                                        </div>
                                        <!-- END SIDEBAR USERPIC -->
                                        <!-- SIDEBAR USER TITLE -->
                                        <div class="profile-usertitle">
                                            <div class="profile-usertitle-name">
                                                <?php echo info('username'); ?>
                                            </div>
                                            <div class="profile-usertitle-job">
                                                <?php if (empty(info('major'))) {
    echo 'major';
} else {
    echo info('major');
}
?>
                                            </div>
                                        </div>
                                        <div class="profile-usermenu">
                                            <div id="home-view" class="menu-items active">
                                                <a>
                                                    <i class="glyphicon glyphicon-home"></i> Overview </a>
                                            </div>
                                            <div id="group-view" class="menu-items">
                                                <a>
                                                    <i class="glyphicon glyphicon-user"></i> Group
                                                </a>
                                                <?php do_action('groups'); ?>
                                            </div>
                                            <div id="pivacy" class="menu-items">
                                                <a>
                                                    <i class="glyphicon glyphicon-eye-close"></i> Pivacy </a>
                                            </div>
                                        </div>
                                        <!-- END MENU -->
                                    </div>
                                </div>
                                <div class="col-md-9">
                                    <div id="profile-contents" class="profile-content">
                                    </div>
                                    <div id="btn-quick-link">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br>
                        <br>

                    </div>
                    <!-- #content -->
                </div>
                <!-- #primary -->
                <?php get_sidebar(); ?>
            </div>
        </div>
        <!-- #single-sidebar-container -->
        <?php get_sidebar('second'); ?>
    </div>
    <!-- #main-wrapper -->
</div>
<!-- .container -->
<?php get_footer(); ?>