# chef-identify Cookbook

Identify your nodes with colors.

This cookbook overrides the PS1 variable via the PROMPT_COMMAND variable. 

### recipes

#### default

Creates a file in the /etc/profile.d directory which will be loaded in every bash session.

### attributes

default[:identify][:file]   - The name of the file created in the /etc/profile.d directory.
default[:identify][:color]  - The color of the prompt.

#### usage

Supported colors: 

* light purple
* purple
* brown
* white
* red
* blue
* light blue
* yellow
* black

Add default recipe to run list:

```ruby
recipe[identify]
```

Set color using node attributes:

``` ruby
identify: {
  color: 'red'
}
```


