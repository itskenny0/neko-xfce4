FROM nurdism/neko:base

COPY xfce4/ /home/neko/.config/xfce4/
COPY google-chrome/ /home/neko/.config/google-chrome/

RUN set -eux; \
    chown -R neko:neko /home/neko/.config/xfce4/ ; \
    chown -R neko:neko /home/neko/.config/google-chrome/ ; \
    echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list ; \
    apt-get update; \
    apt-get install --no-install-recommends --allow-unauthenticated -f -y xfce4 mpv qbittorrent htop terminator google-chrome-stable sudo; \
    apt-get clean -y; \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/*; \
    echo "neko ALL=(ALL) NOPASSWD:ALL" >/etc/sudoers.d/neko 

COPY supervisord.conf /etc/neko/supervisord/xfce4.conf
COPY default.pa /etc/pulse/default.pa
