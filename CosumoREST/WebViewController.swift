//
//  WebViewController.swift
//  CosumoREST
//
//  Created by Salvador Lopez on 28/07/23.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*if let url = URL(string: "http://www.aprendeinglessila.com/2013/06/this-that-these-those/"){
            let request = URLRequest(url: url)
            webView.load(request)
        }*/
        var contenidoHTML = """
<table class="views-table sticky-enabled cols-5 tableheader-processed sticky-table">
         <thead>
      <tr>
                  <th class="views-field views-field-model views-align-left" scope="col">
            <a href="/catalogo/shields-arduino/18?order=model&amp;sort=asc" title="ordenar por Código SKU" class="active">Código SKU</a>          </th>
                  <th class="views-field views-field-entity-id views-align-center" scope="col">
                      </th>
                  <th class="views-field views-field-title views-align-left" scope="col">
            <a href="/catalogo/shields-arduino/18?order=title&amp;sort=asc" title="ordenar por Título" class="active">Título</a>          </th>
                  <th class="views-field views-field-display-price views-align-right" scope="col">
            Precio          </th>
                  <th class="views-field views-field-buyitnowbutton views-align-center" scope="col">
                      </th>
              </tr>
    </thead>
    <tbody>
          <tr class="odd views-row-first">
                  <td class="views-field views-field-model views-align-left">
            C-006          </td>
                  <td class="views-field views-field-entity-id views-align-center">
            <a href="/shields-arduino/gprsgsm-shield-sim900-arduino-celular-shield/62"><img src="https://banshee.mx/sites/default/files/styles/uc_product_list/public/gprs_gsm_sim900_shield_1_9_banshee.mx_.jpg?itok=5l-wcCmJ" width="100" height="67" alt="GPRS/GSM Shield SIM900 Arduino (Celular Shield)" title="GPRS/GSM Shield SIM900 Arduino (Celular Shield)"></a>          </td>
                  <td class="views-field views-field-title views-align-left">
            <a href="/shields-arduino/gprsgsm-shield-sim900-arduino-celular-shield/62">GPRS/GSM Shield SIM900 Arduino (Celular Shield)</a>          </td>
                  <td class="views-field views-field-display-price views-align-right">
            <span class="uc-price">$650.00</span>          </td>
                  <td class="views-field views-field-buyitnowbutton views-align-center">
            <form action="/catalogo/shields-arduino/18" method="post" id="uc-catalog-buy-it-now-form-62" accept-charset="UTF-8"><div><input type="hidden" name="nid" value="62">
<input type="hidden" name="form_build_id" value="form-qQ8YSn7tj-_q9RVFpn03OKg4i6fkSXt85z8KKmQSeeE">
<input type="hidden" name="form_id" value="uc_catalog_buy_it_now_form_62">
<div class="form-actions form-wrapper" id="edit-actions--2"><span class="button edit-submit-62">
    <input type="submit" name="op" id="edit-submit-62" value="Agregar a la cesta" class="list-add-to-cart form-submit">
    </span>
</div></div></form>          </td>
              </tr>
          <tr class="even">
                  <td class="views-field views-field-model views-align-left">
            C-011          </td>
                  <td class="views-field views-field-entity-id views-align-center">
            <a href="/shields-arduino/shield-io-de-expansi-n-para-arduino-nano/259"><img src="https://banshee.mx/sites/default/files/styles/uc_product_list/public/nano_sensor_shield1_21_banshee.mx_.jpg?itok=mWLY08kA" width="100" height="67" alt="Sensor Shield I/O de Expancion para Arduino Nano" title="Sensor Shield I/O de Expancion para Arduino Nano"></a>          </td>
                  <td class="views-field views-field-title views-align-left">
            <a href="/shields-arduino/shield-io-de-expansi-n-para-arduino-nano/259">Shield I/O de Expansión para Arduino Nano</a>          </td>
                  <td class="views-field views-field-display-price views-align-right">
            <span class="uc-price">$80.00</span>          </td>
                  <td class="views-field views-field-buyitnowbutton views-align-center">
            <form action="/catalogo/shields-arduino/18" method="post" id="uc-catalog-buy-it-now-form-259" accept-charset="UTF-8"><div><input type="hidden" name="nid" value="259">
<input type="hidden" name="form_build_id" value="form-rkmkrLzgY51C3t1qm__ARx6VwRxkRhbfeNoLmi4Bsp0">
<input type="hidden" name="form_id" value="uc_catalog_buy_it_now_form_259">
<div class="form-actions form-wrapper" id="edit-actions--4"><span class="button edit-submit-259">
    <input type="submit" name="op" id="edit-submit-259" value="Agregar a la cesta" class="list-add-to-cart form-submit">
    </span>
</div></div></form>          </td>
              </tr>
          <tr class="odd">
                  <td class="views-field views-field-model views-align-left">
            C-017          </td>
                  <td class="views-field views-field-entity-id views-align-center">
            <a href="/shields-arduino-impresion-3d-y-cnc/cnc-shield-v31-de-4-ejes-arduino-gbrl-compatible/320"><img src="https://banshee.mx/sites/default/files/styles/uc_product_list/public/shield_cnc_uno_3_430_banshee.mx_.jpg?itok=YByu4IeT" width="100" height="67" alt="CNC Shield V3.1 de 4 Ejes Arduino GBRL Compatible" title="CNC Shield V3.1 de 4 Ejes Arduino GBRL Compatible"></a>          </td>
                  <td class="views-field views-field-title views-align-left">
            <a href="/shields-arduino-impresion-3d-y-cnc/cnc-shield-v31-de-4-ejes-arduino-gbrl-compatible/320">CNC Shield V3.1 de 4 Ejes Arduino GBRL Compatible</a>          </td>
                  <td class="views-field views-field-display-price views-align-right">
            <span class="uc-price">$100.00</span>          </td>
                  <td class="views-field views-field-buyitnowbutton views-align-center">
            <form action="/catalogo/shields-arduino/18" method="post" id="uc-catalog-buy-it-now-form-320" accept-charset="UTF-8"><div><input type="hidden" name="nid" value="320">
<input type="hidden" name="form_build_id" value="form-m0gvQy2t5Mz4VET5KmBiUuV9GfomjcLEquiYaD1HNjM">
<input type="hidden" name="form_id" value="uc_catalog_buy_it_now_form_320">
<div class="form-actions form-wrapper" id="edit-actions--6"><span class="button edit-submit-320">
    <input type="submit" name="op" id="edit-submit-320" value="Agregar a la cesta" class="list-add-to-cart form-submit">
    </span>
</div></div></form>          </td>
              </tr>
          <tr class="even">
                  <td class="views-field views-field-model views-align-left">
            C-012          </td>
                  <td class="views-field views-field-entity-id views-align-center">
            <a href="/shields-arduino/shield-pantalla-tactil-touch-screen-tft-24-arduino-agotada/268"><img src="https://banshee.mx/sites/default/files/styles/uc_product_list/public/tft_24_shield_3_58_banshee.mx_.jpg?itok=AVkls_ur" width="100" height="67" alt="Sensor Shield I/O de Expancion para Arduino Nano" title="Sensor Shield I/O de Expancion para Arduino Nano"></a>          </td>
                  <td class="views-field views-field-title views-align-left">
            <a href="/shields-arduino/shield-pantalla-tactil-touch-screen-tft-24-arduino-agotada/268">Shield Pantalla Tactil Touch Screen TFT 2.4 Arduino Agotada</a>          </td>
                  <td class="views-field views-field-display-price views-align-right">
            <span class="uc-price">$0.00</span>          </td>
                  <td class="views-field views-field-buyitnowbutton views-align-center">
            <form action="/catalogo/shields-arduino/18" method="post" id="uc-catalog-buy-it-now-form-268" accept-charset="UTF-8"><div><input type="hidden" name="nid" value="268">
<input type="hidden" name="form_build_id" value="form-wpSOtbR-44WQ1L1CR7vrjd9zngZEBazopMU4VTv16aU">
<input type="hidden" name="form_id" value="uc_catalog_buy_it_now_form_268">
<div class="form-actions form-wrapper" id="edit-actions--8"><span class="button edit-submit-268">
    <input type="submit" name="op" id="edit-submit-268" value="Agregar a la cesta" class="list-add-to-cart form-submit">
    </span>
</div></div></form>          </td>
              </tr>
          <tr class="odd">
                  <td class="views-field views-field-model views-align-left">
            C-018          </td>
                  <td class="views-field views-field-entity-id views-align-center">
            <a href="/shields-arduino-impresion-3d-y-cnc/cnc-shield-v4-de-3-ejes-arduino-nano-gbrl-compatible/321"><img src="https://banshee.mx/sites/default/files/styles/uc_product_list/public/shield_cnc_nano_3_425_banshee.mx_.jpg?itok=JyqeQ6SU" width="100" height="67" alt="CNC Shield V4 de 3 Ejes Arduino Nano GBRL Compatible" title="CNC Shield V4 de 3 Ejes Arduino Nano GBRL Compatible"></a>          </td>
                  <td class="views-field views-field-title views-align-left">
            <a href="/shields-arduino-impresion-3d-y-cnc/cnc-shield-v4-de-3-ejes-arduino-nano-gbrl-compatible/321">CNC Shield V4 de 3 Ejes Arduino Nano GBRL Compatible</a>          </td>
                  <td class="views-field views-field-display-price views-align-right">
            <span class="uc-price">$220.00</span>          </td>
                  <td class="views-field views-field-buyitnowbutton views-align-center">
            <form action="/catalogo/shields-arduino/18" method="post" id="uc-catalog-buy-it-now-form-321" accept-charset="UTF-8"><div><input type="hidden" name="nid" value="321">
<input type="hidden" name="form_build_id" value="form-KVDWHGGg2cejExKkGA0DjMvDOESqv4lk0JVZdoqf7Tc">
<input type="hidden" name="form_id" value="uc_catalog_buy_it_now_form_321">
<div class="form-actions form-wrapper" id="edit-actions--10"><span class="button edit-submit-321">
    <input type="submit" name="op" id="edit-submit-321" value="Agregar a la cesta" class="list-add-to-cart form-submit">
    </span>
</div></div></form>          </td>
              </tr>
          <tr class="even">
                  <td class="views-field views-field-model views-align-left">
            C-016          </td>
                  <td class="views-field views-field-entity-id views-align-center">
            <a href="/shields-arduino/sensor-shield-expansi-n-v50-arduino-uno-leonardo-r3/319"><img src="https://banshee.mx/sites/default/files/styles/uc_product_list/public/sensor_shield_v5_2_419_banshee.mx_.jpg?itok=0XIjXeZq" width="100" height="67" alt="Sensor Shield Expansión V5.0 Arduino UNO Leonardo R3" title="Sensor Shield Expansión V5.0 Arduino UNO Leonardo R3"></a>          </td>
                  <td class="views-field views-field-title views-align-left">
            <a href="/shields-arduino/sensor-shield-expansi-n-v50-arduino-uno-leonardo-r3/319">Sensor Shield Expansión V5.0 Arduino UNO Leonardo R3</a>          </td>
                  <td class="views-field views-field-display-price views-align-right">
            <span class="uc-price">$80.00</span>          </td>
                  <td class="views-field views-field-buyitnowbutton views-align-center">
            <form action="/catalogo/shields-arduino/18" method="post" id="uc-catalog-buy-it-now-form-319" accept-charset="UTF-8"><div><input type="hidden" name="nid" value="319">
<input type="hidden" name="form_build_id" value="form-KqDEajUVyxw5apkzNiKJwufbomM-C19V3jWP537J9pE">
<input type="hidden" name="form_id" value="uc_catalog_buy_it_now_form_319">
<div class="form-actions form-wrapper" id="edit-actions--12"><span class="button edit-submit-319">
    <input type="submit" name="op" id="edit-submit-319" value="Agregar a la cesta" class="list-add-to-cart form-submit">
    </span>
</div></div></form>          </td>
              </tr>
          <tr class="odd">
                  <td class="views-field views-field-model views-align-left">
            C-010          </td>
                  <td class="views-field views-field-entity-id views-align-center">
            <a href="/shields-arduino/descontinuada-atwin-linksprite-gsmgprs-shield-de-arduino/8"><img src="https://banshee.mx/sites/default/files/styles/uc_product_list/public/SAM_1047.JPG?itok=rWVmIJ9r" width="100" height="75" alt="Atwin LinkSprite GSM/GPRS Shield cuatribanda para Arduino" title="Atwin LinkSprite GSM/GPRS Shield cuatribanda para Arduino"></a>          </td>
                  <td class="views-field views-field-title views-align-left">
            <a href="/shields-arduino/descontinuada-atwin-linksprite-gsmgprs-shield-de-arduino/8">DESCONTINUADA Atwin LinkSprite GSM/GPRS Shield de Arduino</a>          </td>
                  <td class="views-field views-field-display-price views-align-right">
            <span class="uc-price">$0.00</span>          </td>
                  <td class="views-field views-field-buyitnowbutton views-align-center">
            <form action="/catalogo/shields-arduino/18" method="post" id="uc-catalog-buy-it-now-form-8" accept-charset="UTF-8"><div><input type="hidden" name="nid" value="8">
<input type="hidden" name="form_build_id" value="form-u41pS-beHiIXeRqhaTFD8PCapFzorWpj7DQOtjFV-hg">
<input type="hidden" name="form_id" value="uc_catalog_buy_it_now_form_8">
<div class="form-actions form-wrapper" id="edit-actions--14"><span class="button edit-submit-8">
    <input type="submit" name="op" id="edit-submit-8" value="Agregar a la cesta" class="list-add-to-cart form-submit">
    </span>
</div></div></form>          </td>
              </tr>
          <tr class="even">
                  <td class="views-field views-field-model views-align-left">
            C-013          </td>
                  <td class="views-field views-field-entity-id views-align-center">
            <a href="/shields-arduino/shield-de-ejercicios-y-aprendizaje-para-arduino/284"><img src="https://banshee.mx/sites/default/files/styles/uc_product_list/public/shield_de_ejercicios_1_50_banshee.mx_.jpg?itok=lomyx2s_" width="100" height="67" alt="Shield de Ejercicios y Aprendizaje para Arduino" title="Shield de Ejercicios y Aprendizaje para Arduino"></a>          </td>
                  <td class="views-field views-field-title views-align-left">
            <a href="/shields-arduino/shield-de-ejercicios-y-aprendizaje-para-arduino/284">Shield de Ejercicios y Aprendizaje para Arduino</a>          </td>
                  <td class="views-field views-field-display-price views-align-right">
            <span class="uc-price">$120.00</span>          </td>
                  <td class="views-field views-field-buyitnowbutton views-align-center">
            <form action="/catalogo/shields-arduino/18" method="post" id="uc-catalog-buy-it-now-form-284" accept-charset="UTF-8"><div><input type="hidden" name="nid" value="284">
<input type="hidden" name="form_build_id" value="form-tw6bN12g9UM9b2UbMp2badiAMqcFCqy3zpCDlxcyWkg">
<input type="hidden" name="form_id" value="uc_catalog_buy_it_now_form_284">
<div class="form-actions form-wrapper" id="edit-actions--16"><span class="button edit-submit-284">
    <input type="submit" name="op" id="edit-submit-284" value="Agregar a la cesta" class="list-add-to-cart form-submit">
    </span>
</div></div></form>          </td>
              </tr>
          <tr class="odd">
                  <td class="views-field views-field-model views-align-left">
            C-009          </td>
                  <td class="views-field views-field-entity-id views-align-center">
            <a href="/shields-arduino/sensor-shield-para-arduino-mega-servo-shield/59"><img src="https://banshee.mx/sites/default/files/styles/uc_product_list/public/mega_sensor_shield_banshee.mx_1.jpg?itok=GDCZE1Id" width="100" height="67" alt="Sensor Shield para Arduino MEGA (Servo Shield)" title="Sensor Shield para Arduino MEGA (Servo Shield)"></a>          </td>
                  <td class="views-field views-field-title views-align-left">
            <a href="/shields-arduino/sensor-shield-para-arduino-mega-servo-shield/59">Sensor Shield para Arduino MEGA (Servo Shield)</a>          </td>
                  <td class="views-field views-field-display-price views-align-right">
            <span class="uc-price">$140.00</span>          </td>
                  <td class="views-field views-field-buyitnowbutton views-align-center">
            <form action="/catalogo/shields-arduino/18" method="post" id="uc-catalog-buy-it-now-form-59" accept-charset="UTF-8"><div><input type="hidden" name="nid" value="59">
<input type="hidden" name="form_build_id" value="form-bwNiDJTtEZhpKUMzUw-VRhX6WgoM_ERqiqJgIoIs3NU">
<input type="hidden" name="form_id" value="uc_catalog_buy_it_now_form_59">
<div class="form-actions form-wrapper" id="edit-actions--18"><span class="button edit-submit-59">
    <input type="submit" name="op" id="edit-submit-59" value="Agregar a la cesta" class="list-add-to-cart form-submit">
    </span>
</div></div></form>          </td>
              </tr>
          <tr class="even">
                  <td class="views-field views-field-model views-align-left">
            C-008          </td>
                  <td class="views-field views-field-entity-id views-align-center">
            <a href="/shields-arduino/lcd-1602-keypad-shield-para-arduino-lcd-16x2-y-6-botones/60"><img src="https://banshee.mx/sites/default/files/styles/uc_product_list/public/lcd_push_botton_shield2_19_banshee.mx_.jpg?itok=VwwK2Wqf" width="100" height="67" alt="LCD 1602 KeyPad Shield para Arduino (LCD 16x2 y 6 botones)" title="LCD 1602 KeyPad Shield para Arduino (LCD 16x2 y 6 botones)"></a>          </td>
                  <td class="views-field views-field-title views-align-left">
            <a href="/shields-arduino/lcd-1602-keypad-shield-para-arduino-lcd-16x2-y-6-botones/60">LCD 1602 KeyPad Shield para Arduino (LCD 16x2 y 6 botones)</a>          </td>
                  <td class="views-field views-field-display-price views-align-right">
            <span class="uc-price">$110.00</span>          </td>
                  <td class="views-field views-field-buyitnowbutton views-align-center">
            <form action="/catalogo/shields-arduino/18" method="post" id="uc-catalog-buy-it-now-form-60" accept-charset="UTF-8"><div><input type="hidden" name="nid" value="60">
<input type="hidden" name="form_build_id" value="form-DatWTLUSUTTnX79dpk1-LZO4m7GEPMF60Bfeuj_3ywE">
<input type="hidden" name="form_id" value="uc_catalog_buy_it_now_form_60">
<div class="form-actions form-wrapper" id="edit-actions--20"><span class="button edit-submit-60">
    <input type="submit" name="op" id="edit-submit-60" value="Agregar a la cesta" class="list-add-to-cart form-submit">
    </span>
</div></div></form>          </td>
              </tr>
          <tr class="odd">
                  <td class="views-field views-field-model views-align-left">
            C-007          </td>
                  <td class="views-field views-field-entity-id views-align-center">
            <a href="/shields-arduino/ethernet-shield-para-arduino-w5100/28"><img src="https://banshee.mx/sites/default/files/styles/uc_product_list/public/ethernet_shield_w5100_1_4_banshee.mx_.jpg?itok=kBXLhpfs" width="100" height="67" alt="Ethernet Shield para Arduino W5100" title="Ethernet Shield para Arduino W5100"></a>          </td>
                  <td class="views-field views-field-title views-align-left">
            <a href="/shields-arduino/ethernet-shield-para-arduino-w5100/28">Ethernet Shield para Arduino W5100</a>          </td>
                  <td class="views-field views-field-display-price views-align-right">
            <span class="uc-price">$220.00</span>          </td>
                  <td class="views-field views-field-buyitnowbutton views-align-center">
            <form action="/catalogo/shields-arduino/18" method="post" id="uc-catalog-buy-it-now-form-28" accept-charset="UTF-8"><div><input type="hidden" name="nid" value="28">
<input type="hidden" name="form_build_id" value="form-0B_VvPNwPCAMvipju9Gg13rEzZ0zDgIw6uLJtUoL-QI">
<input type="hidden" name="form_id" value="uc_catalog_buy_it_now_form_28">
<div class="form-actions form-wrapper" id="edit-actions--22"><span class="button edit-submit-28">
    <input type="submit" name="op" id="edit-submit-28" value="Agregar a la cesta" class="list-add-to-cart form-submit">
    </span>
</div></div></form>          </td>
              </tr>
          <tr class="even">
                  <td class="views-field views-field-model views-align-left">
            C-004          </td>
                  <td class="views-field views-field-entity-id views-align-center">
            <a href="/shields-arduino/xbee-shield-para-arduino-soporta-bluetooth-wifi-y-compatibles/90"><img src="https://banshee.mx/sites/default/files/styles/uc_product_list/public/xbee_shield_2_76_banshee.mx_.jpg?itok=bwpbZg7c" width="100" height="67" alt="Xbee Shield para Arduino Soporta Bluetooth, WiFi y compatibles." title="Xbee Shield para Arduino Soporta Bluetooth, WiFi y compatibles."></a>          </td>
                  <td class="views-field views-field-title views-align-left">
            <a href="/shields-arduino/xbee-shield-para-arduino-soporta-bluetooth-wifi-y-compatibles/90">Xbee Shield para Arduino Soporta Bluetooth, WiFi y compatibles.</a>          </td>
                  <td class="views-field views-field-display-price views-align-right">
            <span class="uc-price">$100.00</span>          </td>
                  <td class="views-field views-field-buyitnowbutton views-align-center">
            <form action="/catalogo/shields-arduino/18" method="post" id="uc-catalog-buy-it-now-form-90" accept-charset="UTF-8"><div><input type="hidden" name="nid" value="90">
<input type="hidden" name="form_build_id" value="form-7CGe98UYs8G2KlbixScQQR1qfC7GmTpH_DaeRzdxoiA">
<input type="hidden" name="form_id" value="uc_catalog_buy_it_now_form_90">
<div class="form-actions form-wrapper" id="edit-actions--24"><span class="button edit-submit-90">
    <input type="submit" name="op" id="edit-submit-90" value="Agregar a la cesta" class="list-add-to-cart form-submit">
    </span>
</div></div></form>          </td>
              </tr>
          <tr class="odd">
                  <td class="views-field views-field-model views-align-left">
            C-002          </td>
                  <td class="views-field views-field-entity-id views-align-center">
            <a href="/shields-arduino/host-usb-adk-shield-para-arduino/98"><img src="https://banshee.mx/sites/default/files/styles/uc_product_list/public/usb_host_adk_shield_11_73_banshee.mx_.jpg?itok=GwzvzAow" width="100" height="67" alt="Host USB ADK Shield para Arduino " title="Host USB ADK Shield para Arduino "></a>          </td>
                  <td class="views-field views-field-title views-align-left">
            <a href="/shields-arduino/host-usb-adk-shield-para-arduino/98">Host USB ADK Shield para Arduino </a>          </td>
                  <td class="views-field views-field-display-price views-align-right">
            <span class="uc-price">$300.00</span>          </td>
                  <td class="views-field views-field-buyitnowbutton views-align-center">
            <form action="/catalogo/shields-arduino/18" method="post" id="uc-catalog-buy-it-now-form-98" accept-charset="UTF-8"><div><input type="hidden" name="nid" value="98">
<input type="hidden" name="form_build_id" value="form-OjHNh1Zzx5h3j6rRw9eLIsplC9BCe6wosImgglNYapc">
<input type="hidden" name="form_id" value="uc_catalog_buy_it_now_form_98">
<div class="form-actions form-wrapper" id="edit-actions--26"><span class="button edit-submit-98">
    <input type="submit" name="op" id="edit-submit-98" value="Agregar a la cesta" class="list-add-to-cart form-submit">
    </span>
</div></div></form>          </td>
              </tr>
          <tr class="even">
                  <td class="views-field views-field-model views-align-left">
            C-001          </td>
                  <td class="views-field views-field-entity-id views-align-center">
            <a href="/shields-arduino/protoshield-para-arduino-uno-y-protoboard-170pts/58"><img src="https://banshee.mx/sites/default/files/styles/uc_product_list/public/proto_shield_3_30_banshee.mx_.jpg?itok=mfeuwH_4" width="100" height="67" alt="ProtoShield para Arduino Prototipado" title="ProtoShield para Arduino Prototipado"></a>          </td>
                  <td class="views-field views-field-title views-align-left">
            <a href="/shields-arduino/protoshield-para-arduino-uno-y-protoboard-170pts/58">ProtoShield para Arduino UNO y  Protoboard 170pts</a>          </td>
                  <td class="views-field views-field-display-price views-align-right">
            <span class="uc-price">$80.00</span>          </td>
                  <td class="views-field views-field-buyitnowbutton views-align-center">
            <form action="/catalogo/shields-arduino/18" method="post" id="uc-catalog-buy-it-now-form-58" accept-charset="UTF-8"><div><input type="hidden" name="nid" value="58">
<input type="hidden" name="form_build_id" value="form-aE2v17SRYJj3dz5rWO6r4_bfNKmVCP-0kjhQdYjE3MY">
<input type="hidden" name="form_id" value="uc_catalog_buy_it_now_form_58">
<div class="form-actions form-wrapper" id="edit-actions--28"><span class="button edit-submit-58">
    <input type="submit" name="op" id="edit-submit-58" value="Agregar a la cesta" class="list-add-to-cart form-submit">
    </span>
</div></div></form>          </td>
              </tr>
          <tr class="odd views-row-last">
                  <td class="views-field views-field-model views-align-left">
            C-005          </td>
                  <td class="views-field views-field-entity-id views-align-center">
            <a href="/shields-arduino/sensor-shield-v40-arduino-uno-leonardo-r3/7"><img src="https://banshee.mx/sites/default/files/styles/uc_product_list/public/uno_sensor_shield2_61_banshee.mx_.jpg?itok=DiYfVk2V" width="100" height="67" alt="Sensor Shield V4.0 Arduino UNO Leonardo" title="Sensor Shield V4.0 Arduino UNO Leonardo"></a>          </td>
                  <td class="views-field views-field-title views-align-left">
            <a href="/shields-arduino/sensor-shield-v40-arduino-uno-leonardo-r3/7">Sensor Shield V4.0 Arduino UNO Leonardo R3</a>          </td>
                  <td class="views-field views-field-display-price views-align-right">
            <span class="uc-price">$90.00</span>          </td>
                  <td class="views-field views-field-buyitnowbutton views-align-center">
            <form action="/catalogo/shields-arduino/18" method="post" id="uc-catalog-buy-it-now-form-7" accept-charset="UTF-8"><div><input type="hidden" name="nid" value="7">
<input type="hidden" name="form_build_id" value="form-kOwPrNLMMCGqFDfHvlvLfAMXMOfyJ-n-61uOqkcg5wU">
<input type="hidden" name="form_id" value="uc_catalog_buy_it_now_form_7">
<div class="form-actions form-wrapper" id="edit-actions--30"><span class="button edit-submit-7">
    <input type="submit" name="op" id="edit-submit-7" value="Agregar a la cesta" class="list-add-to-cart form-submit">
    </span>
</div></div></form>          </td>
              </tr>
      </tbody>
</table>

"""
        webView.loadHTMLString(contenidoHTML, baseURL: nil)
        
        
    }

}
