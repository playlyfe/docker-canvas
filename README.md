# Docker Canvas

Dockerized canvas to be used as a development environment.

## Installation

### Step 1: Install ansible

We use ansible to setup the local development environment. You can install it using the package manager available on your OS. We use Ubuntu in the example here.

```bash
apt-get install ansible
```

### Step 2: Build the docker image

We build the docker image which will serve as the development environment for us.

```bash
./build-docker-image.sh
```

### Step 3: Setup the local environment

We need to configure the environment before setting it up. We do this by modifying the environment parameters in `ansible/playbooks/canvas/group_vars/all`.

<table>
  <thead>
    <th>Parameter</th>
    <th>Description</th>
  </thead>
  <tbody>
    <tr>
      <td>
        canvas_src
      </td>
      <td>
        The location of the canvas source code on your local machine
      </td>
    </tr>
    <tr>
      <td>
        canvas.admin_email
      </td>
      <td>
        The canvas admin email address
      </td>
    </tr>
    <tr>
      <td>
        canvas.admin_password
      </td>
      <td>
        The canvas admin password
      </td>
    </tr>
    <tr>
      <td>
        canvas.account_name
      </td>
      <td>
        The canvas admin account name
      </td>
    </tr>
    <tr>
      <td>
        canvas.stats_collection
      </td>
      <td>
        The canvas stats collection policy
      </td>
    </tr>

  </tbody>
</table>

The ansible script creates a local canvas user on your machine.
It then creates a folder `/etc/canvas` where we store all the configuration files related to canvas, apache and postgres. It also creates a symlink of the source code which points to the location provided by you in `ansible/playbooks/canvas/group_vars/all`.

You must run the `deploy-local.sh` script as sudo because it requires permissions to create the canvas user on your machine.

```bash
sudo ./deploy-local.sh
```

Once the deployment completes the canvas lms should be accessible on `localhost`.
