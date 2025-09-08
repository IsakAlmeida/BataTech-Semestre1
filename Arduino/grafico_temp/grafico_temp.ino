// Definições de variáveis
const int PINO_TEMPERATURA = A1; //Define o Sensor de Temperatura na porta analógica 1
float temperaturaCelsius; //Variável de temperatura em celsius

//Configurações 
void setup() {
  Serial.begin(9600); //Inicia o serial
}

//Execução
void loop() {
int valorLeitura = analogRead(PINO_TEMPERATURA); //Coleta os dados do Sensor de Temperatura
 temperaturaCelsius = (valorLeitura * 5.0 / 1023.0)/ 0.01; //Atribui a variável temperaturaCelsius a conversão do valor de temperatura para Clesius


 Serial.print("TempMax:");
 Serial.print(22);                     //Define o valor máximo no gráfico
 Serial.print(" ");
 Serial.print("Temperatura do solo: ");
 Serial.print(temperaturaCelsius);     // Imprime no monitor serial a temperatura do solo e define a linha da temperatura atual no gráfico
 Serial.print(" °C");
 Serial.print(" ");
 Serial.print("TempMin:");            //Define o valor mínimo no gráfico
 Serial.println(15);

   delay(2000);                     // tempo de pausa a cada execução do código
}
