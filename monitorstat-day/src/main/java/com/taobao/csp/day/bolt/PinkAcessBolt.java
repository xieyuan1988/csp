package com.taobao.csp.day.bolt;

import java.util.Map;

import org.apache.log4j.Logger;

import backtype.storm.task.OutputCollector;
import backtype.storm.task.TopologyContext;
import backtype.storm.topology.IRichBolt;
import backtype.storm.topology.OutputFieldsDeclarer;
import backtype.storm.tuple.Fields;
import backtype.storm.tuple.Tuple;

import com.taobao.csp.day.sph.SphStatistics;
import com.taobao.csp.day.tddl.TddlLog;

/***
 * @time 2012-12-06
 * @author youji.zj
 *
 */
public class PinkAcessBolt implements IRichBolt {

	public static Logger logger = Logger.getLogger(PinkAcessBolt.class);
	
	private static final long serialVersionUID = 1L;
	
	private OutputCollector _collector;

	@Override
	public void prepare(Map stormConf, TopologyContext context,
			OutputCollector collector) {
		this._collector = collector;
	}

	@Override
	public void execute(Tuple input) {
		String appName = input.getStringByField("appName");
		long count = input.getLongByField("count");
		String collectTime = input.getStringByField("collectTime");
		logger.info(appName + " " + count + " " + collectTime);
		
		_collector.ack(input);
	}

	@Override
	public void cleanup() {
	}

	@Override
	public void declareOutputFields(OutputFieldsDeclarer declarer) {
	
	}

	@Override
	public Map<String, Object> getComponentConfiguration() {
		// TODO Auto-generated method stub
		return null;
	}
}
