<?php
/**
 * Template Name: Contact us Template.
 */
get_header(); ?>

<div class="container">
	<div id="main-wrapper" class="zozo-row row">
		<div id="single-sidebar-container" class="single-sidebar-container <?php zozo_content_sidebar_classes(); ?>">
			<div class="zozo-row row">	
				<div id="primary" class="content-area <?php zozo_primary_content_classes(); ?>">
					<div id="content" class="site-content">
                        <div class="my-container" >
                            <h3>Contact Us</h3>
                        </div>
                    <div class="contact-site">
                        <div class="my-container" >
                            <div class="contact-wrap">
                                <div class="col-lg-4">
                                    <div class="form-contact">
                                        <?php echo do_shortcode('[contact-form-7 id="150" title="Report"]'); ?>
                                    </div>
                                </div>
                                <div class="col-lg-8">
                                    <div class="form-google-map">
                                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.498094226537!2d105.52518396116295!3d21.012746993647358!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x313454b32ca5086d%3A0xa3c62e29d8ab37e4!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBGUFQ!5e0!3m2!1svi!2s!4v1545670324533" width="850" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
                                    </div>                            
                                </div>
                            </div>
                        </div>    
                    </div>
					</div><!-- #content -->
				</div><!-- #primary -->
			
				<?php get_sidebar(); ?>
				
			</div>
		</div><!-- #single-sidebar-container -->

		<?php get_sidebar('second'); ?>
		
	</div><!-- #main-wrapper -->
</div><!-- .container -->
<?php get_footer(); ?>