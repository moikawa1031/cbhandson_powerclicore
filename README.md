# cbhandson_powerclicore

最新版のPowerclicoreダウンロード<br>

最新版のPowerclicoreダウンロード<br>
sudo docker pull vmware/powerclicore:latest<br>

#スクリプトの実行<br>
sudo docker run --rm --entrypoint="/usr/bin/pwsh" -v /home/vmware/script:/mnt vmware/powerclicore /mnt/CBhandson_script/LinuxContainer/Test_Snapshot_Pod_Create.ps1<br>
