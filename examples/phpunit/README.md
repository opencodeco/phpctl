# PHPUnit

This is an example to show how to run PHPUnit using `phpctl`.

It is also a short tutorial on how to configure PhpStorm to run PHPUnit tests using the `phpctl` image.

## PhpStorm

### CLI Interpreter

First we need to setup a Remote Interpreter to use `opencodeco/phpctl`.

At the *Settings*, go to *Languages & Frameworks* and select *PHP*.

<img width="1094" alt="Screenshot 2024-01-26 at 11 41 28" src="https://github.com/opencodeco/phpctl/assets/183722/b8756269-e966-4aa2-9b78-722f85f207cb">

Click on the 3 dots menus (`...`) on the right side of the window, at the *CLI Interpreter* option.

<img width="936" alt="Screenshot 2024-01-26 at 11 46 21" src="https://github.com/opencodeco/phpctl/assets/183722/31b76f4c-49dd-47a4-8bfa-2a66011e4b5e">

Then click on the plus sign (`+`) button and choose *From Docker, Vagrant...*.

<img width="353" alt="Screenshot 2024-01-26 at 11 44 26" src="https://github.com/opencodeco/phpctl/assets/183722/168087d2-174f-419b-b758-3682406ee91b">

Now choose the *Docker* option, select [your corresponding Docker server](https://www.jetbrains.com/help/phpstorm/docker.html#connect_to_docker), the `opencodeco/phpctl` image and at the *PHP interpreter path* just type `php`.

<img width="902" alt="Screenshot 2024-01-26 at 11 47 07" src="https://github.com/opencodeco/phpctl/assets/183722/bcf9cbbe-9e0d-42f7-b7d4-a147a836eb8f">

Click **OK** to get the configured interpreter.

<img width="936" alt="Screenshot 2024-01-26 at 11 49 53" src="https://github.com/opencodeco/phpctl/assets/183722/0ba61769-10ef-473c-b184-add6f168db1a">

Then just hit **OK** again. We are done.

### Test Frameworks

At the *Settings*, go to *Languages & Frameworks*, open the *PHP* toggle and select *Test Frameworks*.

<img width="1130" alt="Screenshot 2024-01-26 at 11 52 04" src="https://github.com/opencodeco/phpctl/assets/183722/dbf6f4ea-2a57-4c2a-98f7-e59e0211cc6a">

Click on the plus sign button (`+`) and chosse *PHPUnit by Remote Interpreter*.

<img width="308" alt="Screenshot 2024-01-26 at 11 52 15" src="https://github.com/opencodeco/phpctl/assets/183722/063a80ee-93ba-4b21-80f9-18c2b1871075">

Select the remote interpreter we just created.

<img width="556" alt="Screenshot 2024-01-26 at 11 52 31" src="https://github.com/opencodeco/phpctl/assets/183722/d11c8274-f910-4c89-9622-abc2921b3aee">

And click **OK**.

<img width="1094" alt="Screenshot 2024-01-26 at 11 57 04" src="https://github.com/opencodeco/phpctl/assets/183722/85463d36-1516-4548-adcf-ff6aab5c7172">

Then click **OK** again.

Inside a project, go to *Settings*, then *Languages & Frameworks*, open the *PHP* toggle and select *Test Frameworks* again.

<img width="1326" alt="Screenshot 2024-01-26 at 11 57 49" src="https://github.com/opencodeco/phpctl/assets/183722/2b9d0e2c-fec4-46d9-bb8e-7e1a619240cc">

At the *PHPUnit library* we just need to configure the *Path to script* option.

You should point it to your `vendor/autoload.php`, **but** keep in main that the path starts at `/opt/project` directory, that is the container's directory, not you host directory.

In this case, the `phpctl` project root is at `/opt/project` then to point to the `vendor/autoload.php` from this example, we need to add the `examples/phpunit` directory.

<img width="1326" alt="Screenshot 2024-01-26 at 11 59 13" src="https://github.com/opencodeco/phpctl/assets/183722/a356ec76-a9ee-4c3f-bd7b-92b09340d1ad">

> [!NOTE]  
> Your configuration will probably be something simpler like `/opt/project/vendor/autoload.php`. 

Click **Apply** and **OK**.

### Run Configurations

Now click on the top level menu *Run*.

<img width="449" alt="Screenshot 2024-01-26 at 12 06 07" src="https://github.com/opencodeco/phpctl/assets/183722/b3213bad-e47b-46cd-931f-ecf0cfce15af">

And select *Edit Configurations...*

<img width="1002" alt="Screenshot 2024-01-26 at 12 06 18" src="https://github.com/opencodeco/phpctl/assets/183722/6d559e72-4536-48c5-8ccc-6ae3769a6d61">

Click on the plus sign button (`+`) or *Add new...* 

<img width="352" alt="Screenshot 2024-01-26 at 12 08 01" src="https://github.com/opencodeco/phpctl/assets/183722/5a62884f-3199-491b-997f-5df7eded4d94">

And choose the *PHPUnit* configuration.

<img width="1229" alt="Screenshot 2024-01-26 at 12 09 12" src="https://github.com/opencodeco/phpctl/assets/183722/3eff9f51-e8d1-4938-ac40-12112391e1c5">

Give it a good name, I'm calling this one as *PHPUnit Example* then:
- At the *Test Runner* section, choose the *Defined in the configuration file* option.
- Then enable the *Use alternative configuration file* option and point it to your `phpunit.xml` file.
- At the *Command Line* section, in the *Interpreter* option, select the previus created interpreter `opencodeco/phpctl:php82`.

<img width="1229" alt="Screenshot 2024-01-26 at 12 12 10" src="https://github.com/opencodeco/phpctl/assets/183722/1a86b785-ef69-419f-8718-727428baff48">

Click **Apply** and **OK**.

Now you can run the PHPUnit configuration we just created.

<img width="369" alt="Screenshot 2024-01-26 at 12 16 47" src="https://github.com/opencodeco/phpctl/assets/183722/73673779-cfcb-49da-b773-ebc2e7ac795f">

And everything should ok fine.

<img width="1792" alt="Screenshot 2024-01-26 at 12 17 37" src="https://github.com/opencodeco/phpctl/assets/183722/ec7f5e45-dfa2-4a51-8cee-55a2a241e4b5">

The command PhpStorm should be using will be something similar to:
```text
[docker://opencodeco/phpctl:php82/]:php /opt/project/examples/phpunit/vendor/phpunit/phpunit/phpunit --configuration /opt/project/examples/phpunit/phpunit.xml --teamcity
```

---

Feel free to open any issues if any of these steps didn't worked well for you.
