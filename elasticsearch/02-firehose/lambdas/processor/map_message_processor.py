from base64 import b64encode, b64decode
import json
import uuid

def handler(event, context):
	records = event['records']
	for record in records:
		record.pop('approximateArrivalTimestamp', None)
		msg = b64encode(bytes(json.dumps({'message': f'bye world! {uuid.uuid4()}'}), 'utf-8')).decode('ascii')
		record.update({'data': msg})
		record.update({'result': 'Ok'}) # Ok, Dropped, ProcessingFailed
	print(json.dumps(records))
	return {'records': records}
