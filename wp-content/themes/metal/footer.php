<?php
/**
 * The template for displaying the footer.
 *
 * @package Zozothemes
 */
?>
	</div><!-- #main -->
	
	<?php
		/**
		 * @hooked - zozo_featured_post_slider - 5
		**/
		do_action('zozo_header_wrapper_end');
	?>
	
	<?php if( zozo_get_theme_option( 'zozo_footer_style' ) == 'hidden' ) { ?>
		</div><!-- .wrapper-inner -->
	<?php } ?>
	
	<div id="footer" class="footer-section footer-style-<?php echo esc_attr( zozo_get_theme_option( 'zozo_footer_style' ) ); ?> footer-skin-<?php echo esc_attr( zozo_get_theme_option( 'zozo_footer_skin' ) ); ?>">	
		<?php if( zozo_get_theme_option( 'zozo_enable_back_to_top' ) && zozo_get_theme_option( 'zozo_back_to_top_position' ) == 'footer_top' ) { ?>
		<div id="zozo-back-to-top" class="footer-backtotop footer-top-position">					
			<a href="#zozo_wrapper"><i class="glyphicon glyphicon-arrow-up"></i></a>
		</div><!-- #zozo-back-to-top -->
		<?php } ?>
					
		<?php $post_id = zozo_get_post_id();
		
		$show_footer_widgets = '';
		$show_footer_widgets = get_post_meta( $post_id, 'zozo_show_footer_widgets', true );
		if( isset( $show_footer_widgets ) && $show_footer_widgets == '' || $show_footer_widgets == 'default' ) {
			$show_footer_widgets = zozo_get_theme_option( 'zozo_footer_widgets_enable' );
			if( $show_footer_widgets == 1 ) {
				$show_footer_widgets = 'yes';
			} else {
				$show_footer_widgets = 'no';
			}
		}
		
		$show_footer_menu = '';
		$show_footer_menu = get_post_meta( $post_id, 'zozo_show_footer_menu', true );
		if( isset( $show_footer_menu ) && $show_footer_menu == '' || $show_footer_menu == 'default' ) {
			$show_footer_menu = zozo_get_theme_option( 'zozo_enable_footer_menu' );
			if( $show_footer_menu == 1 ) {
				$show_footer_menu = 'yes';
			} else {
				$show_footer_menu = 'no';
			}
		}
				
		if( isset( $show_footer_widgets ) && $show_footer_widgets == 'yes' ) { ?>
		<div id="footer-widgets-container" class="footer-widgets-section">
			<div class="container">
				<div class="zozo-row row">
					<?php						
						$columns = footer_widget_column_classes( 'yes', 'no' );
						$classes = footer_widget_column_classes( 'no', 'yes' );
						
						for( $i = 1; $i <= intval( $columns ); $i++ ) { 
							if( is_active_sidebar( 'footer-widget-' . $i ) ) { ?>
							<div id="footer-widgets-<?php echo esc_attr( $i ); ?>" class="footer-widgets <?php echo esc_attr( $classes[$i] ); ?>">
								<?php dynamic_sidebar( 'footer-widget-' . esc_attr( $i ) ); ?>
							</div>
							<?php }	
						} ?>
				</div><!-- .row -->
			</div>
		</div><!-- #footer-widgets-container -->
		<?php } ?>
		
		<div id="footer-copyright-container" class="footer-copyright-section">
			<div class="container">
				<div class="zozo-row row">
					<?php $copyright_class = $backtotop_class = '';
					if( zozo_get_theme_option( 'zozo_enable_back_to_top' ) ) {
						$copyright_class = "col-sm-7";
						$backtotop_class = "col-sm-5 text-right";
					}
					else {
						$copyright_class = "col-sm-12";
					}
					
					if( zozo_get_theme_option( 'zozo_footer_copyright_align' ) == 'center' ) {
						$copyright_class = "text-center footer-copyright-center";
						$backtotop_class = "text-center";
					}
					?>
					
					<div id="copyright-text" class="<?php echo esc_attr( $copyright_class ); ?>">
						<?php if( zozo_get_theme_option( 'zozo_copyright_text' ) ) {						
						echo '<p>'.do_shortcode( zozo_get_theme_option( 'zozo_copyright_text' ) ).'</p>';							
						} else { ?>						
						<p>&copy; <?php esc_html_e('Copyright', 'zozothemes'); ?> <?php echo date('Y'); ?>. <?php echo esc_html( bloginfo( 'name' ) ); ?>. <?php esc_html_e('All rights reserved.', 'zozothemes'); ?></p>
						<?php } ?>
						
						<?php if( isset( $show_footer_menu ) && $show_footer_menu == 'yes' ) { ?>
						<div class="footer-menu-wrapper">
							<!-- ==================== Footer Menu ==================== -->
							<div class="hidden-xs">
								<?php echo wp_nav_menu( array( 'container_class' => 'zozo-nav footer-menu-navigation', 'container_id' => 'footer-nav', 'menu_id' => 'footer-menu', 'menu_class' => 'nav navbar-nav zozo-footer-nav', 'theme_location' => 'footer-menu', 'fallback_cb' => 'wp_bootstrap_navwalker::fallback', 'walker' => new wp_bootstrap_navwalker() ) ); ?>
							</div>
							<!-- ==================== Mobile Menu ==================== -->
							<div id="footer-mobile-menu-wrapper" class="visible-xs mobile-menu">
								<?php echo wp_nav_menu( array( 'container_class' => 'zozo-nav footer-menu-navigation', 'container_id' => 'footer-mobile-nav', 'menu_id' => 'footer-mobile-menu', 'menu_class' => 'nav navbar-nav zozo-footer-nav', 'theme_location' => 'footer-menu', 'fallback_cb' => 'wp_bootstrap_mobile_navwalker::fallback', 'walker' => new wp_bootstrap_mobile_navwalker() ) ); ?>
							</div>
						</div>
						<?php } ?>
						
					</div><!-- #copyright-text -->									
					<?php if( zozo_get_theme_option( 'zozo_enable_back_to_top' ) && zozo_get_theme_option( 'zozo_back_to_top_position' ) == 'copyright_bar' ) { ?>
					<div id="zozo-back-to-top" class="footer-backtotop footer-copyright-position <?php echo esc_attr( $backtotop_class ); ?>">					
						<a href="#zozo_wrapper"><i class="glyphicon glyphicon-arrow-up"></i></a>
					</div><!-- #zozo-back-to-top -->
					<?php } ?>
					
				</div>
			</div>
		</div><!-- #footer-copyright-container -->		
	</div><!-- #footer -->
</div>
<?php wp_footer(); ?>

</body>
</html>