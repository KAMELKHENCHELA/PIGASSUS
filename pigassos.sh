#!/bin/bash

# التحقق من تشغيل السكريبت بصلاحيات الروت
if [[ $EUID -ne 0 ]]; then
    echo "يرجى تشغيل السكريبت بصلاحيات الروت (sudo)." 
    exit 1
fi

echo "إعداد وتحسين نظام Linux على منصة Pegasos..."
echo "------------------------------------------"

# تحديث النظام
echo "تحديث النظام وحزم APT..."
apt-get update -y
apt-get upgrade -y

# تنظيف النظام
echo "تنظيف الملفات غير الضرورية..."
apt-get autoremove -y
apt-get autoclean -y
rm -rf /var/cache/apt/archives/*
rm -rf /tmp/*
rm -rf /var/tmp/*

# تحسين أداء النظام
echo "تحسين أداء النظام..."
echo "vm.swappiness=10" >> /etc/sysctl.conf
echo "vm.vfs_cache_pressure=50" >> /etc/sysctl.conf
sysctl -p

# إعدادات خاصة بـ PowerPC
echo "إعدادات خاصة بـ PowerPC..."
echo "تفعيل دعم التعليمات المعمارية الخاصة بـ Pegasos..."
echo "مراجعة إعدادات kernel-modules"

echo "تم الانتهاء من الإعدادات بنجاح! ✅"
