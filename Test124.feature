#language: en

@tree

Functionality: <description features>

As <Role>
I want <functional description>
To <business effect>

Background:
	Given I launch TestClient opening script or connect the existing one


Scenario: _0155272 create RSC - RGR - RSR transaction type (pickup), without retail sales receipt
	// And I close all client application windows
	* Для того чтобы передать товар на отправку курьеру необходимо создать документ Retail shipment confirmation
		When in sections panel I select "Retail"
		And I draw a border around UI Automation form items ""
			| 'Name'                          | 'Type'     |
			| 'Retail shipment confirmations' | 'MenuItem' |
		@screenshot
		And Delay 5
		And in functions panel I select "Retail shipment confirmations"	
		And I draw a border around UI Automation form items ""
			| 'Name'       | 'Type'   |
			| 'Create'     | 'Button' |
		@screenshot
		And Delay 5
		And I click the button named "FormCreate"
	* Теперь необходимо заполнить основные реквизиты документа: выбрать компанию, розничного клиента и склад
		@screenshot
		And I click Select button of "Company" field
		And I go to line in "List" table
			| 'Description' |
			| 'Main Company'    |
		And I select current line in "List" table
		And I click Select button of "Retail customer" field
		And I go to line in "List" table
			| 'Description' |
			| 'Sam Jons'    |
		And I select current line in "List" table
		And I select "Courier delivery" exact value from "Transaction type" drop-down list	
		And I click Select button of "Store" field
		And I go to line in "List" table
			| 'Description' |
			| 'Store 02'    |
		And I select current line in "List" table
		And I click Select button of "Courier" field
		And I go to line in "List" table
			| 'Description' |
			| 'Foxred'    |
		And I select current line in "List" table
	* В виде операции необходимо выбрать - Courier delivery и указать курьера, который будет осуществлять доставку
		And I draw a border around UI Automation form items ""
			| 'Name'              | 'Type'     |
			| 'Transaction type:' | 'ComboBox' |
		@screenshot
		And Delay 5
	* Далее необходимо просканировать товары
		And in the table "ItemList" I click "Search by barcode" button
		And I input "2202283705" text in the field named "Barcode"
		And I move to the next attribute
		And in the table "ItemList" I click "Search by barcode" button
		And I input "9009099" text in the field named "Barcode"
		And I move to the next attribute
		And in the table "ItemList" I click "Search by barcode" button
		And I input "9009099" text in the field named "Barcode"
		And I move to the next attribute
		And in the table "ItemList" I click "Search by barcode" button
		And I input "67789997777801" text in the field named "Barcode"
		And I move to the next attribute
		And in the table "SerialLotNumbers" I click "Add" button
		And I click choice button of "Serial lot number" attribute in "SerialLotNumbers" table
		And I go to line in "List" table
			| 'Serial number' |
			| '9090098908'    |
		And I select current line in "List" table
		And I activate "Quantity" field in "SerialLotNumbers" table
		And I input "1,000" text in "Quantity" field of "SerialLotNumbers" table
		And I finish line editing in "SerialLotNumbers" table
		And I click "Ok" button
		@screenshot
		And Delay 5
	* Проводим документ и передаем товар на отправку курьеру
		And I draw a border around UI Automation form items ""
			| 'Name'           | 'Type'   |
			| 'Post and close' | 'Button' |
		@screenshot
		And Delay 5
		And I click "Post and close" button
