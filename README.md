raven-supervisor Cookbook
=========================
Simple cookbook to install and configure python supervisor.  Provides LWRPs for setting up supervisor-managed services.

Requirements
------------

No external requirements.

Attributes
----------

#### raven-supervisor::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['raven_supervisor']['port']</tt></td>
    <td>Integer</td>
    <td>port for http api access</td>
    <td><tt>9110</tt></td>
  </tr>
  <tr>
    <td><tt>['raven_supervisor']['username']</tt></td>
    <td>String</td>
    <td>username for http api access</td>
    <td><tt>admin</tt></td>
  </tr>
  <tr>
    <td><tt>['raven_supervisor']['password']</tt></td>
    <td>String</td>
    <td>password for http api access</td>
    <td><tt>""</tt></td>
  </tr>
</table>

Usage
-----
#### raven-supervisor::default

Include `raven-supervisor` in your run list to install and configure `supervisor`

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[raven-supervisor]"
  ]
}
```
LWRPs
-----

#### raven_supervisor_program


Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Run the tests, ensuring they all pass
5. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Phil Dier <phil@raventools.com>
