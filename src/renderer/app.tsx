// Copyright (c) 2022, NVIDIA CORPORATION.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
import './styles/global.css'
import 'bootstrap/dist/css/bootstrap.min.css';
import * as ReactDOM from 'react-dom';

import { DemoCard } from "./components/demo-card/demo-card";
import { Container, Row, Col } from 'react-bootstrap';

const demos = [
  {
    title: 'Graph Viz',
    description: 'open up a graph vizualization application',
    href: '/demo/graph'
  },
  {
    title: 'Point Cloud',
    description: 'open up a point-cloud vizualization application',
    href: '/demo/point-cloud'
  }
];
 

ReactDOM.render(
  <h1>
    <Container>
      <Row className={"justify-content-center"}>
        {
          demos.map((demo) => (
            <Col xs={12} md={6} lg={4} className={"mb-4"} key={demo['title']}>
              <DemoCard title={demo['title']} description={demo['description']} href={demo['href']} />
            </Col>
          ))
        }
      </Row>
    </Container>
  </h1>
, document.body);
