var Rating = Vue.component("rating", {
    props: {
        rates: { type: Array, required: true },
        starCount: { type: Number, required: false, default: 5 },
        name: { type: String, required: false, default: "unnamed" }
    },
    methods: {
        getRating: function() {
            var rates_length = this.rates.length,
                rates_sum = 0;

            this.rates.forEach(function(rate) {
                rates_sum += rate;
            });

            return (rates_sum / rates_length).toFixed(2);
        },
        getStarValue: function(e, attr) {
            return parseInt(e.target.attributes[attr].value);
        },
        setRatingValue: function(value, options) {
            options = options || { removeClass: true };
            if (options.removeClass)
                $("#w-" + this.widgetID + " .rating__value").removeClass("rating__value--binding");
            else
                $("#w-" + this.widgetID + " .rating__value").addClass("rating__value--binding");

            $("#w-" + this.widgetID + " .rating__value")
                .children(".number").html(value)
                .siblings(".number__animation").html(value);
        },
        hasTargetAttr: function(e, attr) {
            return typeof(e.target.attributes[attr]) != "undefined";
        },


        uniqueRating: function() {
            var chars = ["abcdefghijklmnopqrstuvwxy",
                "ABCDEFGHIJKLMNOPQRSTUVWXY",
                "0123456789"
            ];

            var res = "";
            for (var i = 0; i < 50; i++) {
                var ch_select = Math.floor(Math.random() * chars.length),
                    ch_select_length = Math.floor(Math.random() * chars[ch_select].length);

                res += chars[ch_select].charAt(ch_select_length);
            }

            return res;
        },



        starOff: function(x) {
            $(".star").removeClass("active");
            this.setRatingValue(this.getRating());
        },
        starOn: function(e, x) {
            $(".star").removeClass("active");

            var is_index = this.hasTargetAttr(e, "data-index"),
                is_index_half = this.hasTargetAttr(e, "data-index-half");


            for (var i = 1; i <= x; i++) {
                if (is_index) {
                    $("#w-" + this.widgetID + " .star[data-index-half=" + i + "]").addClass("active");
                    $("#w-" + this.widgetID + " .star[data-index=" + i + "]").addClass("active");
                    this.setRatingValue(this.getStarValue(e, "data-index").toFixed(2), {
                        removeClass: false
                    });
                } else {
                    $("#w-" + this.widgetID + " .star[data-index-half=" + i + "]").addClass("active");
                    $("#w-" + this.widgetID + " .star[data-index=" + (i - 1) + "]").addClass("active");
                    this.setRatingValue((this.getStarValue(e, "data-index-half") - 0.5).toFixed(2), {
                        removeClass: false
                    });
                }
            }

        },



        rate: function(e, x) {
            var currentRating = 0;
            if (this.hasTargetAttr(e, "data-index")) {
                currentRating = this.getStarValue(e, "data-index");
            } else if (this.hasTargetAttr(e, "data-index-half")) {
                currentRating = this.getStarValue(e, "data-index-half") - 0.5;
            }

            this.rates.push(currentRating);
            this.rating = this.getRating();

            this.setFeedback({
                currentRating: currentRating,
                wholeRating: this.rating
            });

            $("#w-" + this.widgetID + " .number__animation")
                .addClass("number__animation--bounce");
            setTimeout(function() {
                $("#w-" + this.widgetID + " .number__animation")
                    .removeClass("number__animation--bounce");
            }.bind(this), 300);

        },

        setFeedback: function(data) {

            // you can put AJAX request right here instead of my example

            $(".rating-box").append(`<div class="rating-box__response">평점 <b>` + data.currentRating + `</b> with <b>` + this.name + `</b>; The total rating is: <b>` + data.wholeRating + `</b></div>`);

        },
    },


    data: function() {
        return {
            rates: [],
            rating: this.getRating(),
            widgetID: this.uniqueRating()
        }
    },


    template: `

    <div class="rating" :id="'w-' + widgetID">
      <div class="stars">

        <template v-for="x in starCount">
          <div class="star__wrapper"
                v-on:mouseover="starOn($event, x)"
                v-on:mouseleave="starOff(x)"
                v-on:click="rate($event, x)">

            <span class="star" 
                  :class="{ selected: x - 1 < rating }"
                  :data-index-half="x"></span>

            <span class="star" 
                  :class="{ selected: x <= rating }" 
                  :data-index="x"></span>
          </div>
        </template>

      </div>
      <div class="rating__value">
        <div class="number">{{rating}}</div>
        <div class="number__animation">{{rating}}</div>
      </div>
    </div>

  `
});

var app = new Vue({
    el: ".app"
});