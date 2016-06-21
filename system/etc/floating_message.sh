#!/sbin/sh

if [ -f /system/csc/feature.xml ] ; then
    if [ -z "`cat /system/csc/feature.xml | grep "CscFeature_Common_EnableAirMessage"`" ] ; then
        sed -i '/\/FeatureSet/D' /system/csc/feature.xml
        sed -i '/\/SamsungMobileFeature/D' /system/csc/feature.xml
        echo '<CscFeature_Common_EnableAirMessage>TRUE</CscFeature_Common_EnableAirMessage>' >> /system/csc/feature.xml
        echo '</FeatureSet>' >> /system/csc/feature.xml
        echo '</SamsungMobileFeature>' >> /system/csc/feature.xml
    fi
    chown 0:0 /system/csc/feature.xml
    chmod 644 /system/csc/feature.xml
    chcon u:object_r:system_file:s0 /system/csc/feature.xml
elif [ -f /system/csc/others.xml ] ; then
    if [ -z "`cat /system/csc/others.xml | grep "CscFeature_Common_EnableAirMessage"`" ] ; then
        sed -i '/\/FeatureSet/D' /system/csc/others.xml
        sed -i '/\/SamsungMobileFeauture/D' /system/csc/others.xml
        echo '    <CscFeature_Common_EnableAirMessage>TRUE</CscFeature_Common_EnableAirMessage>' >> /system/csc/others.xml
        echo '  </FeatureSet>' >> /system/csc/others.xml
        echo '</SamsungMobileFeauture>' >> /system/csc/others.xml
    fi
    chown 0:0 /system/csc/others.xml
    chmod 644 /system/csc/others.xml
    chcon u:object_r:system_file:s0 /system/csc/others.xml
else
    echo '<SamsungMobileFeauture>' > /system/csc/others.xml
    echo '  <FeatureSet>' >> /system/csc/others.xml
    echo '    <CscFeature_Common_EnableAirMessage>TRUE</CscFeature_Common_EnableAirMessage>' >> /system/csc/others.xml
    echo '  </FeatureSet>' >> /system/csc/others.xml
    echo '</SamsungMobileFeauture>' >> /system/csc/others.xml
    chown 0:0 /system/csc/others.xml
    chmod 644 /system/csc/others.xml
    chcon u:object_r:system_file:s0 /system/csc/others.xml
fi

sync
