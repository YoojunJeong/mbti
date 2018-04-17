(function ( $ ) {
    if (!$.river) {
        $.river = {};
    }

    $.river.dotify = function( options ) {
        var base = this,
            isOn = false;        

        base.start = function () {
            isOn = true;            
            base.process( options );
        };

        base.callback = function( result ) {            
            var jsonObj = JSON.parse(result);
            if(jsonObj.result) {
                var message = jsonObj.message;

                for (var k in message){
                    if (message.hasOwnProperty(k)) {                        
                        $($.river.dotify.elements[k]).html(message[k]);                        
                    }
                }
            }
        };

        base.process = function ( options ) {                                
            var base = this;          
            if( !isOn ) return ;
            $.ajax({
                    method : options.method,
                    url : options.source,
                    status : options.parameter
                }).done(
                        function(result){                                                          
                            if( options.callback ){
                                options.callback(result);
                            } else {
                                base.callback(result);
                            }                            
                            setTimeout(function(){ base.process(options); },options.timespan);
                        }
                );         

        };

        base.stop = function () {
            isOn = false;
        };

        return base;     
    };

    $.river.dotify.container = {};
    $.river.dotify.elements = {};

    $.river.dotify.defaults = {
    	timespan : 1500,
        autostart : true,
        source : '', // require
        parameter : '',
        callback : null, // require        
        method : 'POST'
    };

    $.river.dotify.init = function ( options , name ) {
    	// base - 
        var base = this,
    	           options = $.extend( {}, base.defaults, options),
                   obj;

        obj = $.river.dotify(options);

        //obj = base( options );                   
   
        if( !options.callback ) {
            // dotify 기본 콜백
            $(document.querySelectorAll('[data-dotify]')).each( function( index, element ){    
                //console.log(element);          
                base.elements[element.dataset.dotify] = element;            
            });
        }
        if( !options.source ) {
            return ;
        }

        if( !name ) {            
            base.add( 'global' , obj ) ;
        } else {
            base.add( name , obj ) ;
        }

        if( base.defaults.autostart ) {           
            obj.start();
        }
    };

    $.river.dotify.add = function ( name , obj ) {
        var base = this;
     
        if( base.container.hasOwnProperty(name) ) {
            
            base.container[name].stop();    
            base.container[name] = null;
        }
        base.container[name] = obj;

    };

    $.river.dotify.stop = function ( name ) {
        var base = this;
        if( !name ) {
            name = 'global';
        }        
        if( base.container.hasOwnProperty(name) ) {
            base.container[name].stop();
        }
    };   

})( jQuery );