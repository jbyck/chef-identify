# chef-identify Cookbook

Clearly identify your Chef nodes through your bash prompt.  

### Overview

This cookbook customizes the color of the Ubuntu bash prompt by overriding the PS1 environment variable. 


### Recipes

#### system_install

Overrides PS1 for every user of the system by setting PS1 from PROMPT_COMMAND.

### Attributes

* default[:identify][:file]   - The name of the file created in the /etc/profile.d directory.
* default[:identify][:color]  - The color of the prompt.

#### usage

The prompt can be displayed with any of the following supported colors: 

* white
* purple
* light purple
* brown
* red
* light red
* blue
* light blue
* yellow
* black
* cyan
* light cyan

Add default recipe to run list:

```ruby
recipe[identify]
```

Set color using node attributes:

``` ruby
identify: {
  file: 'identify.sh'
  color: 'red'
}
```
* NOTE: The changes made by this cookbook are only visible in LOGIN shells.


### Roadmap

* user_install
* customize text