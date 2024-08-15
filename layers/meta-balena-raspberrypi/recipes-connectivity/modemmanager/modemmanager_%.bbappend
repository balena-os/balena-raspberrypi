SRCREV = "14192af87e26822973e4da971bbc60fe6d6280c2"
SRC_URI = "git://gitlab.freedesktop.org/mobile-broadband/ModemManager.git;protocol=https;branch=main"
RDEPENDS:${PN} += "bash"

SRC_URI:remove = "file://0002-quectel-disable-qmi-unsolicited-profile-manager-even.patch"
SRC_URI:remove = "file://0003-broadband-modem-qmi-quectel-fix-task-completion-when.patch"
