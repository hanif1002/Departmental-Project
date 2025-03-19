# SCR-Based Room Appliance Controller

## Project Description
This project is a **4-room appliance control system** designed using **Silicon-Controlled Rectifiers (SCRs)** in **NI Multisim 14**. The system enables independent control of **lights, fans, and a pump** in four rooms by regulating AC power through SCR-based phase-angle triggering. The circuit provides smooth and efficient power regulation for household appliances.

---

## Key Features
- **SCR-Based Control:** Uses SCRs for phase-angle triggering to regulate AC power.
- **Independent Room Control:** Each room has separate controls for lights, fans, and a pump.
- **Voltage Regulation:** Adjusts power delivery using resistors, capacitors, and diodes.
- **Triggering Mechanism:** Zener diodes and resistors determine the trigger voltage for SCRs, enabling precise power control.
- **Simulation Support:** Designed and tested in NI Multisim 14 for accurate performance analysis.

---

## Components Used
### Active Components
- **SCRs (Silicon-Controlled Rectifiers):** For AC power control.
- **Zener Diodes (ZN437B03, 1N5758):** For voltage regulation and triggering.
- **Relays:** For switching and manual control.

### Passive Components
- **Resistors & Capacitors:** For timing and voltage control.
- **Potentiometers:** For user-adjustable settings.

### Simulation Tools
- **Oscilloscope:** For waveform analysis and performance monitoring.
- **NI Multisim 14:** For circuit design and simulation.

---

## Circuit Functionality
1. **SCR Switching:** SCRs control AC loads by phase-angle triggering, enabling smooth power regulation.
2. **Independent Control:** Each room has separate controls for lights, fans, and a pump, allowing customized settings.
3. **Voltage Regulation:** Resistors, capacitors, and diodes ensure stable power delivery to appliances.
4. **Triggering Mechanism:** Zener diodes and resistors determine the trigger voltage, turning on SCRs at the desired phase angle.

---

## Simulation Setup
1. **Open the Project:** Load the circuit file in NI Multisim 14.
2. **Adjust Settings:** Use potentiometers to control light brightness and fan speed.
3. **Monitor Waveforms:** Use the oscilloscope to observe phase-angle control and output waveforms.
4. **Simulate Behavior:** Test the switching behavior of pumps and lights through SCR triggering.
5. **Optimize Performance:** Modify component values to achieve desired results.

---

## How to Use
1. **Power Supply:** Connect the circuit to a 220V AC, 50Hz power source.
2. **Adjust Controls:** Use potentiometers to regulate lights, fans, and pumps in each room.
3. **Observe Output:** Monitor the output waveforms on the oscilloscope for accurate performance analysis.
4. **Test Switching:** Simulate the switching behavior of appliances to ensure proper functionality.

---

## Future Improvements
1. **Microcontroller Integration:** Implement microcontroller-based SCR triggering for digital control.
2. **IoT Integration:** Add remote or IoT-based control for smart home compatibility.
3. **PCB Design:** Develop a PCB layout for real-world implementation.
4. **Energy Monitoring:** Incorporate energy monitoring features to track power consumption.

---

## Contributors
- **Kayed Ibnet** (Roll: 2009053)
- **Abu Hanif Khan** (Roll: 2009054)
