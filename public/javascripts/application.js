$(function(){
var twitter = {
    container: $('#tweets_container'),
    loading_image: $('#twitter_loading'),
    update_interval: 420000, //7 minutes
    clearTimeout: function() {
        if (this.timer_id) {
            clearTimeout(this.timer_id)
        }
    },
    autoUpdate: function() {
        var self = this;
        self.clearTimeout();
        self.timer_id = setTimeout(function() {
            self.initialize();
        }, self.update_interval);
    },
    initialize: function() {
        var self = this;
        self.clearTimeout();
        if ($('#tweets_container').size() > 0) {
            $.ajax({
                type: 'get',
                url: "/twitter_streams/1",
                data: {},
                dataType: 'html',
                ifModified: true,
                beforeSend: function() {
                    self.container.hide('slow');
                    self.loading_image.show('fast');
                },
                success: function(data, status) {
                    if (status != 'notmodified') {
                        self.container.fadeOut(1200, function() {
                            $(this).html(data);
                            $(this).fadeIn(1200);
                        });
                    }
                    self.loading_image.hide('fast');
                    self.autoUpdate();
                },
                error: function() {
                    self.loading_image.hide('fast');
                    //self.autoUpdate();
                }
            });
        }
    }
};
twitter.initialize();
});

$(function(){
var buzz = {
    container: $('#buzz_container'),
    loading_image: $('#buzz_loading'),
    update_interval: 420000, //7 minutes
    clearTimeout: function() {
        if (this.timer_id) {
            clearTimeout(this.timer_id)
        }
    },
    autoUpdate: function() {
        var self = this;
        self.clearTimeout();
        self.timer_id = setTimeout(function() {
            self.initialize();
        }, self.update_interval);
    },
    initialize: function() {
        var self = this;
        self.clearTimeout();
        if ($('#buzz_container').size() > 0) {
            $.ajax({
                type: 'get',
                url: "/buzzs",
                data: {},
                dataType: 'html',
                ifModified: true,
                beforeSend: function() {
                    self.container.hide('slow');
                    self.loading_image.show('fast');
                },
                success: function(data, status) {
                    if (status != 'notmodified') {
                        self.container.fadeOut(1200, function() {
                            $(this).html(data);
                            $(this).fadeIn(1200);
                        });
                    }
                    self.loading_image.hide('fast');
                    self.autoUpdate();
                },
                error: function() {
                    self.loading_image.hide('fast');
                    //self.autoUpdate();
                }
            });
        }
    }
};
buzz.initialize();
});