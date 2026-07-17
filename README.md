# ❄️ config-nixos

Configuración declarativa de NixOS para mi sistema personal. Gestionada con [Nix Flakes](https://nixos.wiki/wiki/Flakes) y [Home Manager](https://github.com/nix-community/home-manager).

---

## Estructura

```
config-nixos/
├── flake.nix              # Punto de entrada principal del flake
├── flake.lock             # Lockfile de dependencias
├── hosts/                 # Configuraciones por máquina
│   ├── default.nix
│   └── <hostname>/
│       ├── configuration.nix
│       └── hardware-configuration.nix
├── modules/               # Módulos reutilizables del sistema
│   ├── desktop/
│   ├── fonts/
│   ├── networking/
│   └── services/
└── home/                  # Configuración de Home Manager
    ├── default.nix
    ├── programs/
    └── dotfiles/
```

---

## Requisitos previos

- NixOS instalado con Flakes habilitados
- Git

Para habilitar Flakes, agrega esto a tu `/etc/nixos/configuration.nix`:

```nix
nix.settings.experimental-features = [ "nix-command" "flakes" ];
```

---

## Instalación

1. Clona el repositorio:

```bash
git clone https://github.com/<tu-usuario>/config-nixos.git ~/.config/nixos
cd ~/.config/nixos
```

2. Revisa y ajusta la configuración de hardware:

```bash
nixos-generate-config --show-hardware-config
# Copia la salida a hosts/<hostname>/hardware-configuration.nix
```

3. Aplica la configuración del sistema:

```bash
sudo nixos-rebuild switch --flake .#<hostname>
```

4. Aplica la configuración de Home Manager (opcional):

```bash
home-manager switch --flake .#<usuario>
```

---

## Uso

### Reconstruir el sistema

```bash
# Aplicar cambios
sudo nixos-rebuild switch --flake .#<hostname>

# Probar sin aplicar permanentemente
sudo nixos-rebuild test --flake .#<hostname>

# Ver el resultado sin activarlo
sudo nixos-rebuild build --flake .#<hostname>
```

### Actualizar dependencias

```bash
nix flake update
sudo nixos-rebuild switch --flake .#<hostname>
```

### Revertir a una generación anterior

```bash
sudo nixos-rebuild switch --rollback
# o desde el bootloader al iniciar
```

---

## Características

- **Flakes** — entorno reproducible con `flake.lock`
- **Home Manager** — gestión de dotfiles y programas de usuario
- **Módulos modulares** — configuración separada por funcionalidad
- **Múltiples hosts** — soporte para diferentes máquinas desde un solo repositorio

---

## Dependencias principales

| Entrada | Descripción |
|--------|-------------|
| `nixpkgs` | Canal principal de paquetes NixOS |
| `home-manager` | Gestión del entorno de usuario |
| `nixpkgs-unstable` | Paquetes en versión más reciente (opcional) |

---

## Licencia

[MIT](LICENSE)
