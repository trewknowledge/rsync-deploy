# rsync-deploy

Deploy to a remote server using rsync.

example usage to sync everything in the workspace folder:
```
- name: deploy to server
        uses: trewknowledge/rsync-deploy@master
        env:
          DEPLOY_KEY: ${{ secrets.SERVER_SSH_KEY }}
          ARGS: "-e -c -r --delete"
          SERVER_PORT: ${{ secrets.SERVER_PORT }}
          FOLDER: "./"
          SERVER_IP: ${{ secrets.SERVER_IP }}
          USERNAME: ${{ secrets.USERNAME }}
          SERVER_DESTINATION: ${{ secrets.SERVER_DESTINATION }}
```

If you only want to sync a specific sub-folder you can put that folder in the folder env var instead
