# cbhandson_powerclicore

ファイルの説明<br>

<br>
パラメータファイルの定義<br>
param.ps1<br>

<br>
Podの展開<br>
Test_Snapshot_Pod_Create.ps1<br>
<br><br><br>

実行方法<br>

1.最新版のPowerclicoreダウンロード<br>
sudo docker pull vmware/powerclicore:latest<br>

2.スクリプトの実行<br>
sudo docker run --rm --entrypoint="/usr/bin/pwsh" -v /home/vmware/script:/mnt vmware/powerclicore /mnt/CBhandson_script/LinuxContainer/Test_Snapshot_Pod_Create.ps1<br>

