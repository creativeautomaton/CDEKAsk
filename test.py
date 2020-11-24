import requests
import json
from requests.packages.urllib3.exceptions import InsecureRequestWarning
requests.packages.urllib3.disable_warnings(InsecureRequestWarning)


def CDEKAsk(query):
    params = {'query': query, 'strat': 'dense_first'}
    res = requests.get('https://covidask.korea.ac.kr/api', params=params, verify=False)
    outs = json.loads(res.text)
    return outs

query = 'Is there concrete evidence for the presence of asymptomatic transmissions?'
results = CDEKAsk(query)


# Top 10 phrase answers from CDEKAsk
print([r['answer'] for r in results['ret']])

# Top 10 sentence answers from CDEKAsk
print([r['context'][r['sent_start']:r['sent_end']] for r in results['ret']])
