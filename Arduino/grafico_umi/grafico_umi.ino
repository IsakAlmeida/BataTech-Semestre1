// Definições de variáveis
const int PINO_SENSOR_UMIDADE_SOLO = A0;  //Define o Sensor de Umidade na porta analógica 0

//Configurações 
void setup() {
  Serial.begin(9600); //Inicia o Serial
  pinMode(PINO_SENSOR_UMIDADE_SOLO, INPUT); // Define o pino como entrada de dados
}

//Execução
void loop() {
int leituraSensor = analogRead(PINO_SENSOR_UMIDADE_SOLO); //Coleta os dados do Sensor de Umidade
float porcentagemUmidade = 100 - (leituraSensor / 1023.0) *100; //Faz a conversão de secura para umidade

 Serial.print("UmiMax:");
 Serial.print(80);                   //Define a umidade máxima no gráfico
 Serial.print(" ");
 Serial.print("Umidade do solo:");  // Imprime no monitor serial a umidade do solo e a linha de umidade atual no gráfico
 Serial.print(porcentagemUmidade);
 Serial.print(" %");
 Serial.print(" ");
 Serial.print("UmiMin:");           //Define a umidade mínima no gráfico
 Serial.println(60);

   delay(2000);   // tempo de pausa a cada execução do código
}
