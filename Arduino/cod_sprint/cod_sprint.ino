// Definições de variáveis
const int PINO_SENSOR_UMIDADE_SOLO = A0; //Define o Sensor de Umidade na porta analógica 0
const int PINO_TEMPERATURA = A1; //Define o Sensor de Temperatura na porta analógica 1
float temperaturaCelsius; //Variável de temperatura em celsius

//Configurações 
void setup() {
  Serial.begin(9600); //Inicia o Serial
  pinMode(PINO_SENSOR_UMIDADE_SOLO, INPUT); // Define o pino como entrada de dados

}

//Execução
void loop() {
 int leituraSensor = analogRead(PINO_SENSOR_UMIDADE_SOLO); //Coleta os dados do Sensor de Umidade
 float porcentagemUmidade = 100 - (leituraSensor / 1023.0) *100; //Faz a conversão de secura para umidade

 int valorLeitura = analogRead(PINO_TEMPERATURA); //Coleta os dados do Sensor de Temperatura
 temperaturaCelsius = (valorLeitura * 5.0 / 1023.0)/ 0.01; //Atribui a variável temperaturaCelsius a conversão do valor de temperatura para Clesius

 Serial.print("Umidade do solo: ");
 Serial.print(porcentagemUmidade); // Imprime no monitor serial a umidade do solo
 Serial.println(" %");

 Serial.print("Temperatura: ");
 Serial.print(temperaturaCelsius); // Imprime no monitor serial a temperatura do solo
 Serial.println(" °C");

 delay(2000); // tempo de pausa a cada execução do código

}
