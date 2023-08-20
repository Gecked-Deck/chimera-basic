#!/usr/bin/env bash
SCRIPT=$HOME'/.local/share/chimera-basic/'
sudo rm -rf ${SCRIPT}
git clone https://github.com/Gecked-Deck/chimera-basic --depth 1 ${SCRIPT}
cd ${SCRIPT}
pip install -r requirements.txt
python setup.py build
python setup.py install --root="${SCRIPT}" --prefix=/usr --skip-build
mkdir -p "${SCRIPT}/etc/systemd/system"
mkdir -p "${SCRIPT}/usr/lib/systemd/user"
install -m 644 "chimera.service" "${SCRIPT}/usr/lib/systemd/user/chimera.service"
install -m 644 "steam-patch.service" "${SCRIPT}/usr/lib/systemd/user/steam-patch.service"
install -m 644 "chimera-proxy.service" "${SCRIPT}/etc/systemd/system/chimera-proxy.service"
install -m 644 "chimera-proxy.socket" "$SCRIPT/etc/systemd/system/chimera-proxy.socket"
