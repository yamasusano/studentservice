// start the popup specific scripts
// safe to use $
jQuery(document).ready(function($) {
								
	window.zozo_tb_height = (92 / 100) * $(window).height();
    window.zozos_height = (71 / 100) * $(window).height();	
    if(window.zozos_height > 550) {
        window.zozos_height = (74 / 100) * $(window).height();		
    }

    $(window).resize(function() {
        window.zozo_tb_height = (92 / 100) * $(window).height();
        window.zozos_height = (71 / 100) * $(window).height();		

        if(window.zozos_height > 550) {
            window.zozos_height = (74 / 100) * $(window).height();			
        }
    });
	
    var zozos = {
    	loadVals: function()
    	{
    		var shortcode = $('#_zozo_shortcode').text(),
    			uShortcode = shortcode;
    		
    		// fill in the gaps eg {{param}}
    		$('.zozo-input').each(function() {
    			var input = $(this),
    				id = input.attr('id'),
    				id = id.replace('zozo_', ''),		// gets rid of the zozo_ prefix
    				re = new RegExp("{{"+id+"}}","g");
    				
    			uShortcode = uShortcode.replace(re, input.val());
    		});
    		
    		// adds the filled-in shortcode as hidden input
    		$('#_zozo_ushortcode').remove();
    		$('#zozo-sc-form-table').prepend('<div id="_zozo_ushortcode" class="hidden">' + uShortcode + '</div>');
    	},
    	cLoadVals: function()
    	{
    		var shortcode = $('#_zozo_cshortcode').text(),
    			pShortcode = '';    			
				row_id = '';
				
				if(shortcode.indexOf("<li>") < 0) {
    				shortcodes = '<br />';
    			} else {
    				shortcodes = '';
    			}
				
			$('.zozo_cshortcodes').each(function() {
				$('.zozo_cshortcodes').remove();
			});
			
    		// fill in the gaps eg {{param}}
    		$('.child-clone-row').each(function() {
    			var row = $(this),
    				rShortcode = shortcode;
    			
    			$('.zozo-cinput', this).each(function() {
    				var input = $(this),
    					id = input.attr('id'),
    					id = id.replace('zozo_', '')		// gets rid of the zozo_ prefix
    					re = new RegExp("{{"+id+"}}","g");
    					
    				rShortcode = rShortcode.replace(re, input.val());
    			});
    	
    			//shortcodes = shortcodes + "<br />" + rShortcode + "<br />";
				
				if(shortcode.indexOf("<li>") < 0) {
    				shortcodes = shortcodes + rShortcode + '<br />';
    			} else {
    				shortcodes = shortcodes + rShortcode;
    			}
				
				//shortcodes = shortcodes + rShortcode + "<br />";
				
				clone_row_id = $(row).attr('data-row');
				
				// adds the filled-in shortcode as hidden input	
				$('.child-clone-rows').prepend('<div id="_zozo_cshortcodes" data-row="' + clone_row_id + '" class="hidden zozo_cshortcodes">' + shortcodes + '</div>');
				
			}); 
			
    		// add to parent shortcode
    		this.loadVals();
    		pShortcode = $('#_zozo_ushortcode').html().replace('{{child_shortcode}}', shortcodes);
    		
    		// add updated parent shortcode
    		$('#_zozo_ushortcode').remove();
    		$('#zozo-sc-form-table').prepend('<div id="_zozo_ushortcode" class="hidden">' + pShortcode + '</div>');
    	},
    	children: function()
    	{
    		// assign the cloning plugin
    		$('.child-clone-rows').appendo({
    			subSelect: '> div.child-clone-row:last-child',
    			allowDelete: false,
    			focusFirst: false,
				onAdd: function(row) {
                    
                    // activate color picker
                    $('.wp-color-picker-field').wpColorPicker({
                        change: function(event, ui) {
                            zozos.loadVals();
                            zozos.cLoadVals();
                        }
                    });
					
					$('.icon-tooltip').tooltip();
										
					// Increment Row Clone Id for new Row					
					var old_row_id = $(row).prev().data('row');					
					var new_row_id = old_row_id + 1;
                    $(row).attr('data-row', new_row_id);
					
					// Increment Upload Id for new Children				
					$(row).find('.zozo_upload_button:not(:first)').each(function() {
						var old_upload_id = $(this).data('upload');						
						var new_upload_id = old_upload_id + 1;
						$(this).attr('data-upload', new_upload_id);
            		});
					
					$(row).find('.zozo_remove_button:not(:first)').each(function() {
						var old_remove_id = $(this).data('remove');						
						var new_remove_id = old_remove_id + 1;
						$(this).attr('data-remove', new_remove_id);
            		});

                    zozos.loadVals();
                    zozos.cLoadVals();
                }
    		});
    		
    		// remove button
    		$('.child-clone-row-remove').live('click', function() {
    			var	btn = $(this),
    				row = btn.parent();
    			
    			if( $('.child-clone-row').size() > 1 )
    			{
					var row_val = $(this).parent().data("row");					
    				$('.child-clone-row[data-row="' + row_val + '"]').remove();
					zozos.loadVals();
                    zozos.cLoadVals();
    			}
    			else
    			{
    				alert('You need a minimum of one row');
    			}
    			
    			return false;
    		});
			    		
    		// assign jUI sortable
    		$( ".child-clone-rows" ).sortable({
				placeholder: "sortable-placeholder",
				items: '.child-clone-row',
				stop: function(event, ui) {
					zozos.loadVals();
					zozos.cLoadVals();
				}				
			});
    	},
    	resizeTB: function()
    	{
			var	ajaxCont = $('#TB_ajaxContent'),
				tbWindow = $('#TB_window'),
				zozoPopup = $('#zozo-popup');

            tbWindow.css({
                height: window.zozo_tb_height,
                width: zozoPopup.outerWidth(),
                marginLeft: -(zozoPopup.outerWidth()/2)
            });
			
			ajaxCont.css({
				paddingTop: 0,
				paddingLeft: 0,
				paddingRight: 0,				
				height: window.zozo_tb_height,
				overflow: 'auto', // IMPORTANT
				width: zozoPopup.outerWidth()
			});
						
			$('#zozo-popup').addClass('no_preview');
			$('#zozo-sc-form-wrap #zozo-sc-form').height(window.zozos_height);
			
			//tbWindow.show();
    	},
    	load: function()
    	{			
    		var	zozos = this,
    			popup = $('#zozo-popup'),
    			form = $('#zozo-sc-form', popup),
    			shortcode = $('#_zozo_shortcode', form).text(),
    			popupType = $('#_zozo_popup', form).text(),
    			uShortcode = '';
				
			// if its the shortcode selection popup
            if($('#_zozo_popup').text() == 'zozo-sc-generator') {
                $('.zozo-sc-form-button').hide();
            }
    		
    		// resize TB		
    		zozos.resizeTB();
    		$(window).resize(function() { zozos.resizeTB() });
    		
    		// initialise
    		zozos.loadVals();
    		zozos.children();
    		zozos.cLoadVals();
			
			$('#TB_load').show(); //show loader			
			$('#TB_window').show();
			$('#TB_ajaxContent').show();
			    					
    		// update on children value change
    		$('.zozo-cinput', form).live('change', function() {
    			zozos.cLoadVals();
    		});
    		
    		// update on value change
    		$('.zozo-input', form).change(function() {
    			zozos.loadVals();
    		});
			
			// change shortcode when a user selects a shortcode from choose a dropdown field
            $('#zozo_select_shortcode').change(function() {
                var name = $(this).val();
                var label = $(this).text();
                
                if(name != 'select') {
                    tinyMCE.activeEditor.execCommand("zozoPopup", false, {
                        title: label,
                        identifier: name
                    });

                    $('#TB_window').hide();
                }
            });
			
			// Update upload & remove button ID
            $('.zozo_upload_button:not(:first)').each(function() {
                var old_upload_id = $(this).data('upload');				
                var new_upload_id = old_upload_id + 1;
                $(this).attr('data-upload', new_upload_id);
            });
			
			$('.zozo_remove_button:not(:first)').each(function() {
                var old_remove_id = $(this).data('remove');
                var new_remove_id = old_remove_id + 1;
                $(this).attr('data-remove', new_remove_id);
            });
			
    	}
	}
	
	// run
    $('#zozo-popup').livequery( function() {
		zozos.load(); 	
		
		$('#zozo-popup').closest('#TB_window').addClass('zozo-shortcodes-thickbox');
		
		// activate color picker
		$('.wp-color-picker-field').wpColorPicker({
			change: function(event, ui) {
				setTimeout(function() {
					zozos.loadVals();
					zozos.cLoadVals();
				}, 1);
			}
		});
		
		$('.icon-tooltip').tooltip();
		
	});
	
	// Icon Selection
    $('.iconpicker i').live('click', function( event ) {
		
        event.preventDefault();
		
		var fontName = $(this).attr('data-iconclass');
		
		 if($(this).hasClass('selected')) {
            $(this).removeClass('selected');
			$(this).parent().parent().find('input').attr('value', '');
        } else {
            $('.iconpicker i').removeClass('selected');
            $(this).addClass('selected');
			$(this).parent().parent().find('input').attr('value', fontName);
        }
		
		zozos.loadVals();
        zozos.cLoadVals();
        
    });
	
	// Init media buttons	
	$(document).on('click', '.zozo_upload_button', function ( event ) {
	 
		event.preventDefault();
		upload_button = $(this);
		
		upload_id = $(this).attr('data-upload');
		var row_id = $(this).closest('ul').parent('.child-clone-row').attr('data-row');		
		
		$(document).on('click', '.zozo_remove_button', function () { 
														
			remove_button = $(this);
			var remove_row_id = $(this).closest('ul').parent('.child-clone-row').attr('data-row');
			
			remove_id = $(this).attr('data-remove');			
			
			if( typeof remove_row_id != "undefined" && remove_row_id != '' ) {				
			
				remove_button.closest('.child-clone-row[data-row="' + remove_row_id + '"]').find('.zozo_remove_button[data-remove="' + remove_id + '"]').parent().find('img').attr('src', '').hide();
				remove_button.closest('.child-clone-row[data-row="' + remove_row_id + '"]').find('.zozo_remove_button[data-remove="' + remove_id + '"]').parent().find('input.zozo-form-upload').attr('value', '');
				remove_button.closest('.child-clone-row[data-row="' + remove_row_id + '"]').find('.zozo_remove_button[data-remove="' + remove_id + '"]').hide();
				remove_button.closest('.child-clone-row[data-row="' + remove_row_id + '"]').find('.zozo_upload_button[data-upload="' + remove_id + '"]').show();		
				
			} else {
				$('.zozo_remove_button[data-remove="' + remove_id + '"]').parent().find('img').attr('src', '').hide();
				$('.zozo_remove_button[data-remove="' + remove_id + '"]').parent().find('input.zozo-form-upload').attr('value', '');
				$('.zozo_remove_button[data-remove="' + remove_id + '"]').hide();
				$('.zozo_upload_button[data-upload="' + remove_id + '"]').show();			      
			}
			
			return;
		});
		 
		// Create the media frame.
		var file_frame = wp.media.frames.file_frame = wp.media({
			title: 'Select Image',
			button: {
				text: 'Upload Image',
			},
			frame: 'post',
			multiple: false // Set to true to allow multiple files to be selected
		});
		
		file_frame.open();
	 
		// When an image is selected, run a callback.
		file_frame.on( 'select', function() {
			
			var selection = file_frame.state().get('selection');
			var size = $('.attachment-display-settings .size').val();
			
			selection.map( function( attachment ) {
				attachment = attachment.toJSON();			 
				// Do something with attachment.id and/or attachment.url here
				
				if(!size) {
				    attachment.url = attachment.url;
			    } else {
				    attachment.url = attachment.sizes[size].url;
			    }
				
				if( typeof row_id != "undefined" && row_id != '' ) {
					upload_button.closest('.child-clone-row[data-row="' + row_id + '"]').find('.zozo_upload_button[data-upload="' + upload_id + '"]').parent().find('img').attr('src', attachment.url).show();
					upload_button.closest('.child-clone-row[data-row="' + row_id + '"]').find('.zozo_upload_button[data-upload="' + upload_id + '"]').parent().find('input.zozo-form-upload').attr('value', attachment.url);					
				} else {
					$('.zozo_upload_button[data-upload="' + upload_id + '"]').parent().find('img').attr('src', attachment.url).show();
					$('.zozo_upload_button[data-upload="' + upload_id + '"]').parent().find('input.zozo-form-upload').attr('value', attachment.url);
				}

                zozos.loadVals();
                zozos.cLoadVals();
			});
			
			if( typeof row_id != "undefined" && row_id != '' ) {
				upload_button.closest('.child-clone-row[data-row="' + row_id + '"]').find('.zozo_upload_button[data-upload="' + upload_id + '"]').hide();
				upload_button.closest('.child-clone-row[data-row="' + row_id + '"]').find('.zozo_remove_button[data-remove="' + upload_id + '"]').show();
			} else {				
				$('.zozo_upload_button[data-upload="' + upload_id + '"]').hide();
				$('.zozo_remove_button[data-remove="' + upload_id + '"]').show();
			}
		});
		
		// When an image is inserted, run a callback.
		file_frame.on( 'insert', function() {
			
		    var selection = file_frame.state().get('selection');
		    var size = $('.attachment-display-settings .size').val();

		    selection.map( function( attachment ) {
			    attachment = attachment.toJSON();
				
				// Get attachment by sizes
			    if(!size) {
				    attachment.url = attachment.url;
			    } else {
				    attachment.url = attachment.sizes[size].url;
			    }
				
				if( typeof row_id != "undefined" && row_id != '' ) {					
					upload_button.closest('.child-clone-row[data-row="' + row_id + '"]').find('.zozo_upload_button[data-upload="' + upload_id + '"]').parent().find('img').attr('src', attachment.url).show();
					upload_button.closest('.child-clone-row[data-row="' + row_id + '"]').find('.zozo_upload_button[data-upload="' + upload_id + '"]').parent().find('input.zozo-form-upload').attr('value', attachment.url);
				} else {				
					$('.zozo_upload_button[data-upload="' + upload_id + '"]').parent().find('img').attr('src', attachment.url).show();
					$('.zozo_upload_button[data-upload="' + upload_id + '"]').parent().find('input.zozo-form-upload').attr('value', attachment.url);
				}

			    zozos.loadVals();
			    zozos.cLoadVals();
		    });	
			
			if( typeof row_id != "undefined" && row_id != '' ) {				
				upload_button.closest('.child-clone-row[data-row="' + row_id + '"]').find('.zozo_upload_button[data-upload="' + upload_id + '"]').hide();
				upload_button.closest('.child-clone-row[data-row="' + row_id + '"]').find('.zozo_remove_button[data-remove="' + upload_id + '"]').show();
			} else {				
				$('.zozo_upload_button[data-upload="' + upload_id + '"]').hide();
				$('.zozo_remove_button[data-remove="' + upload_id + '"]').show();
			}
			
	    });
	 
		// Finally, open the modal
		file_frame.open();
	});
	
	// Table shortcode return when insert clicked
    $('#zozo-sc-form-table .zozo-insert').live('click', function( event ) {
		
        event.stopPropagation();

        var shortcode = $('#zozo_select_shortcode').val();

        if(shortcode == 'table') {
            var style = $('#zozo-sc-form-table #zozo_type').val();
			var rows = $('#zozo-sc-form-table #zozo_rows').val();
            var columns = $('#zozo-sc-form-table #zozo_columns').val();

            var html = '<div class="table-responsive zozo-table"><table class="table table-hover table-' + style +'"><thead><tr>';

            for( var j=0;j<columns;j++ ) {
                html += '<th>Column ' + (j + 1) + '</th>';
            }

            html += '</tr></thead><tbody>';
			
			for(var i=0;i<rows;i++) {
				
				html += '<tr>';
				for(var j=0;j<columns;j++) {					
					html += '<td>Row ' + (i + 1) + ' Col ' + (j + 1) + '</td>';					
				}				
				html += '</tr>';
			}

            html += '</tbody></table></div>';

            if(window.tinyMCE)
            {
                window.tinyMCE.activeEditor.execCommand('mceInsertContent', false, html);
                tb_remove();
            }
        }
    });
	
	// when insert is clicked
	$('.zozo-insert').live('click', function() {
		if(window.tinyMCE)
		{
			window.tinyMCE.activeEditor.execCommand('mceInsertContent', false, $('#_zozo_ushortcode').html());
			tb_remove();
		}
	});
	
});