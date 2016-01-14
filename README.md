# ansible-role-selenium

This is a set of roles for setting up selenium, here's the sample playbook:

```
- hosts: vagrant
  become: yes
  roles:
      - selenium/standalone
      - selenium/client/javascript
      - selenium/webdriver/chromedriver
      - selenium/supervised/eye/standalone
      - selenium/supervised/eye/webdriver/chromedriver
```
