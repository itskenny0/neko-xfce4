  neko:
    build: .
    container_name: neko
    restart: always
    shm_size: "1gb"
    cap_add:
      - "SYS_ADMIN"
    environment:
      DISPLAY: :99.0
      NEKO_BIND: :8080
      NEKO_PASSWORD: neko
      NEKO_ADMIN: admin
      NEKO_WIDTH: 1920
      NEKO_HEIGHT: 1080
    ports:
      - "8080:8080"
      - "59000-59100:59000-59100/udp"
