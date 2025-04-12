# 🎶 HarpTronics: An FPGA-Based Optical Laser Harp

Welcome to **HarpTronics** — a light-sensing, touchless laser harp designed and implemented on an FPGA platform. This project combines optical input, VGA display, and digital sound control, all driven by VHDL and hardware-level timing.

> 📁 Repository name: `fpga-optical-laser-harp`

---

## 🛠️ Project Overview

**HarpTronics** is a digital instrument built using VHDL on an FPGA, where invisible "strings" of light are plucked by interrupting laser beams with your fingers. The system reads inputs via **light sensors**, displays notes and states on **VGA** and **7-segment displays**, and operates entirely without physical strings.

---

## 🔧 Built With

- 🧠 **Xilinx Vivado** – Design and synthesis
- ⚙️ **VHDL** – All logic and modules
- 🧪 **FPGA Board** – [Specify your board, e.g., Basys 3 or Nexys A7]
- 💡 **Photoresistors / Light sensors** – For beam interruption
- 🔲 **VGA output** – Visual feedback
- 🔢 **7-segment display** – Note or state display

---

## 🎯 Features

- 🔦 Optical input using light sensors (photoresistors)
- 🎼 Real-time interaction with VGA visualization
- 🕒 Custom clock division for VGA and 7-segment display
- ⚡ Fully synchronous digital design using finite state machines
- 🔢 Multiplexed 7-segment driver with decoder logic
- ✅ Timing and resource utilization optimized and documented

---

## 📷 Screenshots / Diagrams

*Add photos of your hardware setup, VGA output, or block diagrams here.*

---

## 🧪 Synthesis & Performance

| Metric               | Value     |
|----------------------|-----------|
| Max Clock Frequency  | 50 MHz    |
| Resource Usage       | ~15% LUTs |
| Timing Met?          | Yes       |
| Power (est.)         | ~100 mW   |

> Detailed reports available in `/synthesis/`

---

## 🚀 Getting Started

1. Open `laser_harp.xpr` in **Vivado**
2. Ensure your FPGA board is connected and matches the `.xdc` file
3. Run **Synthesis** → **Implementation** → **Generate Bitstream**
4. Flash the bitstream to your board
5. Watch the magic 🎶

---

## 🔌 Prebuilt Bitstream

You can directly program the FPGA using the provided bitstream file:

👉 [`design_laser_harp.bit`](bitstream/design_laser_harp.bit)

Use Vivado's Hardware Manager to connect your FPGA board and upload the bitstream.

---

## 📜 License

MIT License – Feel free to fork, remix, and build your own photon-powered instruments.

---

## 💡 Inspiration

> "A harp with no strings, yet full of music."  
> This project merges physics, hardware design, and creativity to explore new ways of interaction using light.