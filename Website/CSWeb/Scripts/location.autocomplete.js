"use strict";

(function ($, window) {

    function selectFromDropDown(elId, value) {
        var el = document.getElementById(elId);
        if (!el) {
            return false;
        }
       

        var initalSelected = el.selectedIndex;
        value = value.toLowerCase();
        for (var i = 0; i < el.options.length; i++) {
            var text = $.trim($(el.options[i]).text()).toLowerCase();
            if (text === value) {
                el.selectedIndex = i;
                return initalSelected != i;
            }
        }

        return false;
    }
    
    function LocationAutocomplete(options) {
        this.address = options.address;
        this.city = options.city;
        this.state = options.state;
        this.country = options.country;
        this.zip = options.zip;
        this.stateHidden = options.stateHidden;
        this.countryName = options.countryName;
        this.stateName = options.stateName;
    }

    LocationAutocomplete.prototype.init = function () {
        var address = document.getElementById(this.address);
        if (!address) {
            return;
        }

        var self = this;
        this.autocomplete = new google.maps.places.Autocomplete(address, { types: ["geocode"] });
        this.autocomplete.addListener("place_changed", function () {
            self.fillAddress();
        });
    };

    LocationAutocomplete.prototype.fillAddress = function () {
        var place = this.autocomplete.getPlace();
        if (!place || !place.address_components) {
            return;
        }
        
        var address1 = "";
        var state = "";
        var refreshStates = false;
        for (var i = 0; i < place.address_components.length; i++) {
            var value = place.address_components[i].long_name;
            var type = place.address_components[i].types[0];

            switch (type) {
                case "postal_code":
                    document.getElementById(this.zip).value = value;
                    break;

                case "street_number":
                    address1 = value + " " + address1;
                    break;

                case "route":
                    address1 = address1 + " " + value;
                    break;

                case "locality":
                    document.getElementById(this.city).value = value;
                    break;

                case "administrative_area_level_1":
                    state = window.S(value).latinise().s;
                    break;

                case "country":
                    refreshStates = selectFromDropDown(this.country, value);
                    break;
            }
        }

        address1 = $.trim(address1).replace('  ', ' ');
        document.getElementById(this.address).value = address1;

        if (refreshStates) {
            document.getElementById(this.stateHidden).value = state;
            if (this.countryName != "") {
                setTimeout("__doPostBack('" + this.countryName + "','')", 0);
            }
        } else {
            selectFromDropDown(this.state, state);
            if (this.stateName != "") {
                //document.getElementByName(this.stateName).value = state;
                setTimeout("__doPostBack('" + this.zip + "','')", 0);
            }
        }
    }

    window.LocationAutocomplete = LocationAutocomplete;

})(jQuery, window);