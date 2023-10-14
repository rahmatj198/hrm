<script>
		$('[data-toggle="tooltip"]').tooltip();

		var $b = $('#builder');

		var default_rules = {
		  condition: 'AND',
		  rules: [
		  {
		    id: 'id'
		  },
		  {
		    id: 'customer_id'
		  }
		  ]
		};

		// Fix for Selectize
		$('#builder').on('afterCreateRuleInput.queryBuilder', function(e, rule) {
		  if (rule.filter.plugin == 'selectize') {
		    rule.$el.find('.rule-value-container').css('min-width', '250px')
		      .find('.selectize-control').removeClass('form-control');
		  }
		});

		var options = {
		  allow_empty: true,
		  sort_filters: true,

		  optgroups: {
		    core: {
		      en: 'Core',
		      fr: 'Coeur'
		    }
		  },

		  plugins: {
		    'bt-tooltip-errors': { delay: 100},
		    'sortable': null,
		    'filter-description': { mode: 'bootbox' },
		    'bt-selectpicker': null,
		    'unique-filter': null,
		    'bt-checkbox': { color: 'primary' }
		  },

		  // standard operators in custom optgroups
		  operators: [
		    {type: 'equal',            optgroup: 'basic'},
		    {type: 'not_equal',        optgroup: 'basic'},
		    {type: 'in',               optgroup: 'basic'},
		    {type: 'not_in',           optgroup: 'basic'},
		    {type: 'less',             optgroup: 'numbers'},
		    {type: 'less_or_equal',    optgroup: 'numbers'},
		    {type: 'greater',          optgroup: 'numbers'},
		    {type: 'greater_or_equal', optgroup: 'numbers'},
		    {type: 'between',          optgroup: 'numbers'},
		    {type: 'not_between',      optgroup: 'numbers'},
		    {type: 'begins_with',      optgroup: 'strings'},
		    {type: 'not_begins_with',  optgroup: 'strings'},
		    {type: 'contains',         optgroup: 'strings'},
		    {type: 'not_contains',     optgroup: 'strings'},
		    {type: 'ends_with',        optgroup: 'strings'},
		    {type: 'not_ends_with',    optgroup: 'strings'},
		    {type: 'is_empty'     },
		    {type: 'is_not_empty' },
		    {type: 'is_null'      },
		    {type: 'is_not_null'  }
		  ],

		  filters: [

		    {
		    id: 'id',
		    label: 'Order Id',
		    type: 'string',
		    input: 'select',
		    multiple: true,
		    optgroup: 'main',
		    plugin: 'selectize',
		    plugin_config: {
		      valueField: 'key',
		      labelField: 'value',
		      searchField: 'value',
		      sortField: 'value',
		 		onInitialize: function() {
		        var that = this;		         
					$.getJSON("{{ url('/') }}/get_keyval/orders/id/customer_id", function(data) {
		            localStorage.demoData = JSON.stringify(data);
		            data.forEach(function(item) {
		              that.addOption(item);
		            });
		          });
		    	}
		    },
		    valueSetter: function(rule, value) {
		      rule.$el.find('.rule-value-container select')[0].selectize.setValue(value);
		    }
		  },
		
		   {
		    id: 'customer_id',
		    label: 'Customer',
		    type: 'string',
		    input: 'select',
		    optgroup: 'main',
		    multiple: true,
		    plugin: 'selectize',
		    plugin_config: {
		      valueField: 'key',
		      labelField: 'value',
		      searchField: 'value',
		      sortField: 'value',
		 		onInitialize: function() {
		        var that = this;		          
					$.getJSON("{{ url('/') }}/get_keyval/customers/id/company_name", function(data) {
		            localStorage.demoData = JSON.stringify(data);
		            data.forEach(function(item) {
		              that.addOption(item);
		            });
		          });
		    	}
		    },
		    valueSetter: function(rule, value) {
		      rule.$el.find('.rule-value-container select')[0].selectize.setValue(value);
		    }
		  },
		   {
		    id: 'employee_id',
		    label: 'Handle By',
		    type: 'string',
		    input: 'select',
		    optgroup: 'other',
		    multiple: true,
		    plugin: 'selectize',
		    plugin_config: {
		      valueField: 'key',
		      labelField: 'value',
		      searchField: 'value',
		      sortField: 'value',
		 		onInitialize: function() {
		        var that = this;		          
				  $.getJSON("{{ url('/') }}/get_keyval/employees/id/last_name", function(data) {
					localStorage.demoData = JSON.stringify(data);
		            data.forEach(function(item) {
		              that.addOption(item);
		            });
		          });
		    	}
		    },
		    valueSetter: function(rule, value) {
		      rule.$el.find('.rule-value-container select')[0].selectize.setValue(value);
		    }
		  }, 
		  {
		    id: 'status',
		    label: 'Status',
		    type: 'string',
		    input: 'select',
		    optgroup: 'other',		    
		    values: {
		      'created': 'Created',
		      'in progress': 'In Progress',
		      'completed': 'Completed',
		      'cancelled': 'Cancelled'
				}
			}

		  ],

			rules : default_rules
		};

		// init
		$('#builder').queryBuilder(options);

		$('#builder').on('afterCreateRuleInput.queryBuilder', function(e, rule) {
		    if (rule.filter.plugin == 'selectize') {
		        rule.$el.find('.rule-value-container').css('min-width', '200px')
		          .find('.selectize-control').removeClass('form-control');
		    }
		});


		// reset builder
		$('.reset').on('click', function() {
		  $('#builder').queryBuilder('reset');
		  $('#result').addClass('hide').find('pre').empty();
		});


		$('.display-report').on('click', function() {
			var res = $('#builder').queryBuilder('getSQL', $(this).data('stmt'), false);	
			alert (res.sql);	
			});

</script>