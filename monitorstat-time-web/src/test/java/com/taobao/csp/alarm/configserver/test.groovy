Groovy_v200907@package hqm.test.groovy


public class RoutingRule{
    Map<String, List<String>> routingRuleMap(){
        return [
                "ALL":["*"],
                "G1":["172.23.202.51*","172.23.202.52*","172.23.202.53*","172.23.202.54*","172.23.202.55*","172.23.202.56*","172.23.202.57*","172.23.202.58*","172.23.202.59*","172.23.202.60*","172.23.182.188*","172.23.182.195*","172.23.182.196*","172.23.183.132*","172.23.203.173*","172.23.203.174*","172.23.203.172*","172.23.202.108*","172.23.202.109*","172.23.153.115*","172.23.153.110*","172.23.153.105*","172.23.153.111*","172.23.153.108*","172.23.153.106*","172.23.153.71*","172.23.153.72*","172.23.153.70*","172.23.177.196*","172.24.168.111*","172.24.168.81*","172.24.169.131*","172.24.169.107*","172.24.171.60*","172.24.169.116*","172.24.169.109*","172.24.168.148*","172.24.168.135*","172.24.169.122*","172.24.169.130*","172.24.171.103*","172.24.171.58*","172.24.169.127*","172.24.168.105*","172.24.169.132*","172.24.168.109*","172.24.168.136*","172.24.168.137*","172.24.168.138*","172.24.168.140*","172.24.168.107*","172.24.168.76*","172.24.169.120*","172.24.169.114*","172.24.168.141*","172.24.169.104*","172.24.169.105*","172.24.168.116*","172.24.173.64*","172.24.173.65*","172.24.173.66*","172.24.173.67*","172.24.173.68*","172.24.173.69*","172.24.173.73*","172.24.173.74*","172.24.173.75*","172.24.173.76*","172.23.180.158*","172.23.180.159*","172.23.180.160*","172.23.180.161*","172.23.180.162*","172.23.204.90*","172.23.204.133*","172.23.204.134*","172.23.204.135*","172.23.204.186*","172.24.171.108*","172.24.171.109*","172.24.171.110*","172.24.171.153*","172.24.172.103*","172.24.172.166*","172.23.183.72*","172.23.202.87*","172.23.203.161*","172.23.203.188*","172.23.203.189*","172.23.204.157*"],
	    "G2":["172.23.183.133*","172.23.183.134*","172.23.183.137*","172.23.183.138*","172.23.184.103*","172.23.182.193*","172.23.182.194*","172.23.182.189*","172.23.184.106*","172.23.184.104*","172.23.184.102*","172.23.184.109*","172.23.184.105*","172.23.184.107*","172.23.184.110*","172.23.183.129*","172.23.183.130*","172.23.183.131*","172.23.202.107*","172.23.202.106*","172.23.202.105*","172.23.202.117*","172.23.203.160*","172.23.177.60*","172.24.168.147*","172.24.169.125*","172.24.168.142*","172.24.168.78*","172.24.168.114*","172.24.168.139*","172.24.168.110*","172.24.169.119*","172.24.169.121*","172.24.171.59*","172.24.168.145*","172.24.168.113*","172.24.169.61*","172.24.168.82*","172.24.169.123*","172.24.168.104*","172.24.169.126*","172.24.169.115*","172.24.168.120*","172.24.168.115*","172.24.169.124*","172.24.168.79*","172.24.168.144*","172.24.172.121*","172.24.171.140*","172.24.172.85*","172.24.172.108*","172.24.172.68*","172.23.204.175*","172.23.204.179*","172.23.180.157*","172.23.180.156*","172.23.204.180*","172.24.171.70*","172.24.171.73*","172.24.171.74*","172.24.171.75*","172.24.171.76*","172.24.171.83*","172.24.171.84*","172.24.171.85*","172.24.171.86*","172.24.171.87*","172.24.171.88*","172.23.182.76*","172.23.182.77*","172.23.183.53*","172.23.183.54*","172.23.183.55*","172.23.183.56*","172.23.183.57*","172.23.183.58*","172.23.183.59*","172.23.183.60*","172.23.183.64*"]
        ]
    }  

    String interfaceRoutingRule(){
        return null;
    }
    String mathodRoutingRule(String methodName, String[] paramTypeStrs){
	if(methodName in ["querySingle"]){
	        return "G1";
             }
             return "G2";
    }
     Object argsRoutingRule(String methodName, String[] paramTypeStrs){        
        return null;
    }  
    
    public static void main(String[] args){
    }   
}