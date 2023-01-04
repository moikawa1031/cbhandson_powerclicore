#パラメーターはparam.txtより取得
#$param = Get-Content param.txt
#@($param) -is [Array]

#$vcenterName = $param[1]
#$username = $param[3]
#$passwd = $param[5]
#$pods = [int]($param[7])

#パラメータの読み込み
#. ".\param.ps1"
#Linux Containerで実行する場合のパラメータの読み込み
. "/mnt/CBhandson_script/param.ps1"



Connect-VIServer -Server $vcenterName -User $username -Password $passwd -Force

#テンプレート名がvCenterのテンプレート名を一致していることを必ず確認する「xxxx-temp」
$adtemp = "ad01-temp"
$esxi01temp = "esxi01-temp"
$esxi02temp = "esxi02-temp"
$vc01temp = "vc01-temp"
$st01temp = "st01-temp"

#保存先のデータストア名を必ず確認する
$datastore = "Resource"

Write-Host $pods"Pods展開します" -ForegroundColor green



#ADVMのClone
foreach ($i in @(1..$pods)) {
        $rs = "pod"+$i.ToString(“00”)
        $v = $rs+"-ad01"
        Write-Output($rs)
        Write-Output($v)
        New-VM -Template $adtemp -Name $v -ResourcePool $rs -Datastore $datastore
    }

#esxi01のClone
foreach ($i in @(1..$pods)) {
        $rs = "pod"+$i.ToString(“00”)
        $v = $rs+"-esxi01"
        Write-Output($rs)
        Write-Output($v)
        New-VM -Template $esxi01temp -Name $v -ResourcePool $rs -Datastore $datastore
    }

#esxi02のClone
foreach ($i in @(1..$pods)) {
        $rs = "pod"+$i.ToString(“00”)
        $v = $rs+"-esxi02"
        Write-Output($rs)
        Write-Output($v)
        New-VM -Template $esxi02temp -Name $v -ResourcePool $rs -Datastore $datastore
    }

#vc01のClone
foreach ($i in @(1..$pods)) {
        $rs = "pod"+$i.ToString(“00”)
        $v = $rs+"-vc01"
        Write-Output($rs)
        Write-Output($v)
        New-VM -Template $vc01temp -Name $v -ResourcePool $rs -Datastore $datastore
    }

#st01のClone
foreach ($i in @(1..$pods)) {
        $rs = "pod"+$i.ToString(“00”)
        $v = $rs+"-st01"
        Write-Output($rs)
        Write-Output($v)
        New-VM -Template $st01temp -Name $v -ResourcePool $rs -Datastore $datastore
    }
    Disconnect-VIServer -Server "$vcenterName" -Confirm:$false