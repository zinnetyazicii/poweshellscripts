Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Form Tasarımı
$Form = New-Object System.Windows.Forms.Form
$Form.Text = "Active Directory Kullanıcı Bilgisi"
$Form.Size = New-Object System.Drawing.Size(700, 900)
$Form.StartPosition = "CenterScreen"
$Form.BackColor = [System.Drawing.Color]::FromArgb(240, 240, 240)

# Kullanıcı Adı Etiketi
$Label = New-Object System.Windows.Forms.Label
$Label.Text = "Kullanıcı Adı:"
$Label.Location = New-Object System.Drawing.Point(20, 20)
$Label.AutoSize = $true
$Form.Controls.Add($Label)

# Kullanıcı Adı İçin TextBox
$TextBox = New-Object System.Windows.Forms.TextBox
$TextBox.Location = New-Object System.Drawing.Point(120, 18)
$TextBox.Width = 150
$Form.Controls.Add($TextBox)

# Grup Adı Etiketi
$LabelGrup = New-Object System.Windows.Forms.Label
$LabelGrup.Text = "Grup Adı:"
$LabelGrup.Location = New-Object System.Drawing.Point(20, 20)
$LabelGrup.AutoSize = $true
$LabelGrup.Visible = $false
$Form.Controls.Add($LabelGrup)

# Grup Adı İçin TextBox
$TextBoxGrup = New-Object System.Windows.Forms.TextBox
$TextBoxGrup.Location = New-Object System.Drawing.Point(120, 18)
$TextBoxGrup.Width = 250
$TextBoxGrup.Visible = $false
$Form.Controls.Add($TextBoxGrup)

# Kullanıcı Fotoğrafı
$PictureBox = New-Object System.Windows.Forms.PictureBox
$PictureBox.Location = New-Object System.Drawing.Point(500, 20)
$PictureBox.Size = New-Object System.Drawing.Size(100, 100)
$PictureBox.BorderStyle = "FixedSingle"
$PictureBox.SizeMode = "StretchImage"
$Form.Controls.Add($PictureBox)

# Kullanıcılar Butonu 
$BtnKullanicilar = New-Object System.Windows.Forms.Button
$BtnKullanicilar.Text = "Kullanıcılar"
$BtnKullanicilar.Size = New-Object System.Drawing.Size(100, 30)
$BtnKullanicilar.Location = New-Object System.Drawing.Point(($PictureBox.Location.X - 100), ($PictureBox.Location.Y + $PictureBox.Height + 10)) # Y koordinatını biraz artır
$Form.Controls.Add($BtnKullanicilar)

# Gruplar Butonu 
$BtnGruplar = New-Object System.Windows.Forms.Button
$BtnGruplar.Text = "Gruplar"
$BtnGruplar.Size = New-Object System.Drawing.Size(100, 30)
$BtnGruplar.Location = New-Object System.Drawing.Point(($BtnKullanicilar.Location.X + $BtnKullanicilar.Width), $BtnKullanicilar.Location.Y)
$Form.Controls.Add($BtnGruplar)



# Kullanıcı Bilgilerini Gösteren ListBox
$ListBox = New-Object System.Windows.Forms.ListBox
$ListBox.Location = New-Object System.Drawing.Point(20, 170)
$ListBox.Size = New-Object System.Drawing.Size(600, 300)
$ListBox.SelectionMode = "MultiExtended"
$ListBox.ContextMenuStrip = New-Object System.Windows.Forms.ContextMenuStrip
$CopyMenuItem = New-Object System.Windows.Forms.ToolStripMenuItem
$CopyMenuItem.Text = "Kopyala"
$CopyMenuItem.Add_Click({
    $SelectedItems = $ListBox.SelectedItems | ForEach-Object { $_ }
    if ($SelectedItems) {
        [System.Windows.Forms.Clipboard]::SetText($SelectedItems -join "`r`n")
    }
})
$ListBox.ContextMenuStrip.Items.Add($CopyMenuItem)
$Form.Controls.Add($ListBox)


# Kullanıcı Grupları ListBox
$GroupsListBox = New-Object System.Windows.Forms.ListBox
$GroupsListBox.Location = New-Object System.Drawing.Point(20, 500)
$GroupsListBox.Size = New-Object System.Drawing.Size(600, 250)
$GroupsListBox.SelectionMode = "MultiExtended"
$GroupsListBox.ContextMenuStrip = New-Object System.Windows.Forms.ContextMenuStrip
$CopyMenuItem1 = New-Object System.Windows.Forms.ToolStripMenuItem
$CopyMenuItem1.Text = "Kopyala"
$CopyMenuItem1.Add_Click({
    $SelectedItems = $GroupsListBox.SelectedItems | ForEach-Object { $_ }
    if ($SelectedItems) {
        [System.Windows.Forms.Clipboard]::SetText($SelectedItems -join "`r`n")
    }
})
$GroupsListBox.ContextMenuStrip.Items.Add($CopyMenuItem1)
$Form.Controls.Add($GroupsListBox)




# GrupMemberlarını Gösteren ListBox
$GrupMember = New-Object System.Windows.Forms.ListBox
$GrupMember.Location = New-Object System.Drawing.Point(20, 330)
$GrupMember.Size = New-Object System.Drawing.Size(600, 400)
$GrupMember.SelectionMode = "MultiExtended"
$GrupMember.ContextMenuStrip = New-Object System.Windows.Forms.ContextMenuStrip
$GrupMember.Visible = $false    
$CopyMenuItem = New-Object System.Windows.Forms.ToolStripMenuItem
$CopyMenuItem.Text = "Kopyala"
$CopyMenuItem.Add_Click({
    $SelectedItems = $GrupMember.SelectedItems | ForEach-Object { $_ }
    if ($SelectedItems) {
        [System.Windows.Forms.Clipboard]::SetText($SelectedItems -join "`r`n")
    }
})
$GrupMember.ContextMenuStrip.Items.Add($CopyMenuItem)
$Form.Controls.Add($GrupMember)


# Grup özellikleri
$GroupPropertyListBox = New-Object System.Windows.Forms.ListBox
$GroupPropertyListBox.Location = New-Object System.Drawing.Point(20, 170)
$GroupPropertyListBox.Size = New-Object System.Drawing.Size(600, 150)
$GroupPropertyListBox.SelectionMode = "MultiExtended"
$GroupPropertyListBox.Visible = $false
$GroupPropertyListBox.ContextMenuStrip = New-Object System.Windows.Forms.ContextMenuStrip
$CopyMenuItem1 = New-Object System.Windows.Forms.ToolStripMenuItem
$CopyMenuItem1.Text = "Kopyala"
$CopyMenuItem1.Add_Click({
    $SelectedItems = $GroupPropertyListBox.SelectedItems | ForEach-Object { $_ }
    if ($SelectedItems) {
        [System.Windows.Forms.Clipboard]::SetText($SelectedItems -join "`r`n")
    }
})
$GroupPropertyListBox.ContextMenuStrip.Items.Add($CopyMenuItem1)
$Form.Controls.Add($GroupPropertyListBox)


# Bilgileri Getir Butonu
$Button = New-Object System.Windows.Forms.Button
$Button.Text = "Sorgula"
$Button.Location = New-Object System.Drawing.Point(20, 100)
$Button.BackColor =[System.Drawing.Color]::Red
$Button.ForeColor = [System.Drawing.Color]::White
$Button.Size = New-Object System.Drawing.Size(100, 30)
$Button.Controls.Add($GroupsButton)



# Gruplar Butonu (Sorgula butonunun hemen altında)
$GroupsButton = New-Object System.Windows.Forms.Button
$GroupsButton.Text = "Gruplar"
$GroupsButton.Location = New-Object System.Drawing.Point(20, 100)
$GroupsButton.BackColor =[System.Drawing.Color]::Red
$GroupsButton.ForeColor = [System.Drawing.Color]::White
$GroupsButton.Size = New-Object System.Drawing.Size(100, 30)
$GroupsButton.Visible = $false
$Form.Controls.Add($GroupsButton)
#-------------------------------------------------------------------------------------------------
# Arama Sonuçları için ListBox
# Arama Listesi (AutoComplete) ListBox'u oluştur
$AutoList = New-Object System.Windows.Forms.ListBox
$AutoList.Location = New-Object System.Drawing.Point(120, 40)
$AutoList.Size = New-Object System.Drawing.Size($TextBox.Width, 80)
$AutoList.Visible = $false
$Form.Controls.Add($AutoList)


# TextBox'a yazıldıkça arama tetikleme
$TextBox.Add_TextChanged({
    $Search = $TextBox.Text
    if ($Search.Length -ge 3) {
        try {
            $Matches = Get-ADUser -Filter "SamAccountName -like '$Search*'" -Properties SamAccountName |
                Select-Object -ExpandProperty SamAccountName

            $AutoList.Items.Clear()
            foreach ($match in $Matches) {
                $AutoList.Items.Add($match)
            }

            $AutoList.Visible = $Matches.Count -gt 0
        }
        catch {
            $AutoList.Visible = $false
        }
    }
    else {
        $AutoList.Visible = $false
    }
})


# ListBox’tan seçim yapılınca TextBox’a aktar
$AutoList.Add_MouseDoubleClick({
    $TextBox.Text = $AutoList.SelectedItem
    $AutoList.Visible = $false
})

#-------------------------------------------------------------------------------------------------

# Grup için otomatik tamamlama listesi
$AutoGroupList = New-Object System.Windows.Forms.ListBox
$AutoGroupList.Location = New-Object System.Drawing.Point(120, 40)
$AutoGroupList.Size = New-Object System.Drawing.Size($TextBoxGrup.Width, 80)
$AutoGroupList.Visible = $false
$AutoGroupList.BorderStyle = 'FixedSingle'
$Form.Controls.Add($AutoGroupList)

# Grup arama tetikleyici
$TextBoxGrup.Add_TextChanged({
    $grupAra = $TextBoxGrup.Text
    if ($grupAra.Length -ge 3) {
        try {
            $Gruplar = Get-ADGroup -Filter "Name -like '$grupAra*'" -Properties Name -ResultSetSize 50 |
                       Select-Object -ExpandProperty Name

            $AutoGroupList.Items.Clear()
            foreach ($g in $Gruplar) {
                $AutoGroupList.Items.Add($g)
            }
            $AutoGroupList.Visible = $Gruplar.Count -gt 0
        }
        catch {
            $AutoGroupList.Visible = $false
        }
    } else {
        $AutoGroupList.Visible = $false
    }
})

# Grup listesinden seçim yapılınca TextBox'a yansıt
$AutoGroupList.Add_MouseDoubleClick({
    $TextBoxGrup.Text = $AutoGroupList.SelectedItem
    $AutoGroupList.Visible = $false
})
#-------------------------------------------------------------------------------------------------
$BtnGruplar.Add_Click({
    $GroupsListBox.Visible = $false
    $ListBox.Visible = $false
    $GroupsButton.Visible = $true
    $LabelGrup.Visible = $true
    $TextBoxGrup.Visible = $true
    $Label.Visible = $false
    $TextBox.Visible = $false
    $Button.Visible = $false
    $GroupsButton.Visible = $true
    $PictureBox.Visible = $false
    $GrupMember.Visible = $true
    $GroupPropertyListBox.Visible = $true

})


$BtnKullanicilar.Add_Click({
    $GroupsListBox.Visible = $true
    $ListBox.Visible = $true
    $GroupsButton.Visible = $false
    $LabelGrup.Visible = $false
    $TextBoxGrup.Visible = $false
    $Label.Visible = $true
    $TextBox.Visible = $true
    $Button.Visible = $true
    $GroupsButton.Visible = $false
    $PictureBox.Visible = $true
    $GrupMember.Visible = $false
    $GroupPropertyListBox.Visible = $false    

})


$Button.Add_Click({
    $GroupsListBox.Visible = $true  # Grupları tekrar görünür yap
    $ListBox.Visible = $true        # Kullanıcı bilgilerini tekrar görünür yap    
    $Username = $TextBox.Text
    if ($Username -ne "") {
        Try {
            # Active Directory'den Kullanıcı Bilgilerini Çek
            $User = Get-ADUser -Identity $Username -Properties *

            # Listeyi Temizle
            $ListBox.Items.Clear()
            
            # Manager alanındaki CN değerini temizleyerek sadece Ad Soyad bilgisini çek
            $ManagerName = ($User.Manager -split ",")[0] -replace "CN=", ""

            # Kullanıcı Bilgilerini Listeye Ekle (İkonlarla)
            $ListBox.Items.Add("👤 Adı Soyadı: $($User.DisplayName)")
            $ListBox.Items.Add("🔑 Oturum Açma Adı: $($User.SamAccountName)")
            $ListBox.Items.Add("📧 E-Posta: $($User.Mail)")
            $ListBox.Items.Add("📞 Telefon: $($User.TelephoneNumber)")
            $ListBox.Items.Add("🏷️ Unvan: $($User.Title)")
            $ListBox.Items.Add("👨‍💼 Yönetici: $(if($ManagerName){$ManagerName}else{"Bilgi Yok"})")
            $ListBox.Items.Add("🆔 Sicil Numarası: $($User.EmployeeID)")
            $ListBox.Items.Add("📍 Ofis: $(if($User.physicalDeliveryOfficeName){$User.physicalDeliveryOfficeName}else{"Bilgi Yok"})")
            $ListBox.Items.Add("🏢 Departman: $($User.Department)")       
            $ListBox.Items.Add("⏰ Son Giriş Tarihi: $($User.LastLogonDate)")
            $ListBox.Items.Add("✅ Hesap Durumu: $(if($User.Enabled){"Aktif"}else{"Devre Dışı"})")
           

            
            # Parola Bilgileri
            $PasswordNeverExpires = if ($User.PasswordNeverExpires) { "Evet" } else { "Hayır" }
            $PwdLastSet = $User.PasswordLastSet
            if ($PwdLastSet) {
                $MaxPasswordAge = (Get-ADDefaultDomainPasswordPolicy).MaxPasswordAge.Days
                $DaysUntilPasswordExpires = $MaxPasswordAge - (New-TimeSpan -Start $PwdLastSet -End (Get-Date)).Days
                $ListBox.Items.Add("⏳ Parola Değiştirme Kalan Gün: $DaysUntilPasswordExpires")
            }
            $ListBox.Items.Add("🔒 Parola Süresiz mi?: $PasswordNeverExpires")
            
            # Hesap Süre Sonu Bilgisi
            $AccountExpires = $User.AccountExpires
            if ($AccountExpires -eq 0 -or $AccountExpires -eq 9223372036854775807) {
                $ListBox.Items.Add("⏲️ Hesap Süre Sona Erme Zamanı: Sona Ermez :)")
            } else {
                $ExpireDate = [DateTime]::FromFileTime($AccountExpires)
                $ListBox.Items.Add("⏲️ Hesap Süre Sona Erme Zamanı: Sona Erer:( , $ExpireDate")
            }
            
            # Manager Bilgisi
            if ($User.Manager) {
                $Manager = Get-ADUser -Identity $User.Manager -Properties DisplayName
                $ListBox.Items.Add("👥 Yöneticisi: $($Manager.DisplayName)")
            }
            
            # OU Bilgisi (En alta)
            $ListBox.Items.Add("📂 OU Bilgisi: $($User.DistinguishedName)")
            
            # Hesap Kilitli mi?
            $LockedOut = Search-ADAccount -LockedOut -UsersOnly | Where-Object { $_.SamAccountName -eq $User.SamAccountName }
            if ($LockedOut) {
                $ListBox.Items.Add("🔒 Hesap Kilitli: Evet")
            } else {
                $ListBox.Items.Add("🔓 Hesap Kilitli: Hayır")
            }

           
            
            # Kullanıcı Fotoğrafı
            if ($User.thumbnailPhoto -ne $null) {
                $ImageData = [System.Drawing.Image]::FromStream([System.IO.MemoryStream]::new($User.thumbnailPhoto))
                $PictureBox.Image = $ImageData
            } else {
                $PictureBox.Image = $null
            }


           if ($Username -ne "") {
        Try {
            $Groups = Get-ADUser -Identity $Username -Properties MemberOf | Select-Object -ExpandProperty MemberOf
            $GroupsListBox.Items.Clear()
            if ($Groups) {
                $GroupsListBox.Items.Add("👥 Kullanıcının Grupları:")
                $Groups | ForEach-Object {
                    $CleanGroupName = ($_ -split ',')[0] -replace "^CN=", ""
                    $GroupsListBox.Items.Add($CleanGroupName)
                }
            } else {
                $GroupsListBox.Items.Add("Kullanıcı herhangi bir gruba üye değil.")
            }
        }
        Catch {
            $GroupsListBox.Items.Clear()
            $GroupsListBox.Items.Add("Hata: Kullanıcı bulunamadı!")
        }
    } else {
        $GroupsListBox.Items.Clear()
        $GroupsListBox.Items.Add("Lütfen bir kullanıcı adı girin.")
    }



        } Catch {
            [System.Windows.Forms.MessageBox]::Show("Kullanıcı bulunamadı!", "Hata", "OK", "Error")
        }
    } else {
        [System.Windows.Forms.MessageBox]::Show("Lütfen bir kullanıcı adı girin!", "Uyarı", "OK", "Warning")
    }
})
$Form.Controls.Add($Button)

$GroupsButton.Add_Click({

    $grupName = $TextBoxGrup.Text

    if ($grupName -ne "") {
        Try {
            # Grup Bilgisi Alınıyor
            $GroupInfo = Get-ADGroup -Filter "Name -eq '$grupName'" -Properties GroupCategory, Mail | Select-Object -First 1

            if ($null -eq $GroupInfo) {
                throw "Grup bulunamadı!"
            }

            # Grup Özelliklerini Listele
            $GroupPropertyListBox.Items.Clear()

            if ($GroupInfo.GroupCategory -ne $null) {
            $GroupPropertyListBox.Items.Add("🔎 Kategori: $($GroupInfo.GroupCategory)")
            } else {
                $GroupPropertyListBox.Items.Add("🔎 Kategori bulunamadı!")
            }

            if ($GroupInfo.Mail -ne $null) {
                $GroupPropertyListBox.Items.Add("📧 Mail: $($GroupInfo.Mail)")
            } else {
                $GroupPropertyListBox.Items.Add("📧 Mail adresi yok!")
            }

            # Grup Üyelerini Al
            $Groups = Get-ADGroupMember -Identity $GroupInfo.DistinguishedName | Select-Object -ExpandProperty Name

            # Listeyi Temizle ve Üyeleri Ekle
            $GrupMember.Items.Clear()

            if ($Groups) {
                $GrupMember.Items.Add("👥 Grup Üyeleri:")
                $Groups | ForEach-Object {
                    $CleanGroupName = ($_ -split ',')[0] -replace "^CN=", ""
                    $GrupMember.Items.Add($CleanGroupName)
                }
            } else {
                $GrupMember.Items.Add("Grupta herhangi biri üye değil.")
            }
        }
        Catch {
            $GrupMember.Items.Clear()
            $GrupMember.Items.Add("Hata: $_")
        }
    } else {
        $GrupMember.Items.Clear()
        $GrupMember.Items.Add("Lütfen bir grup adı girin.")
    }
})



# Sürüm ve Web Sitesi Bilgisi - Formun en alt soluna yerleştirme
$VersionLabel = New-Object System.Windows.Forms.Label
$VersionLabel.Text = "Zinnet Arıcı | Sürüm 1.6 | Güncellenme: 2025-05-16"
$VersionLabel.Location = New-Object System.Drawing.Point(20, ($Form.ClientSize.Height - 30)) # Formun en altına konumlandır
$VersionLabel.AutoSize = $true
$VersionLabel.ForeColor = [System.Drawing.Color]::Gray
$Form.Controls.Add($VersionLabel)


# Formu Göster
$Form.ShowDialog()
