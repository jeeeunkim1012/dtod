import React, { useState } from 'react';
import Button from 'react-bootstrap/Button';
import Form from 'react-bootstrap/Form';
import Row from 'react-bootstrap/Row';
import Col from 'react-bootstrap/Col';
import '../../css/contactus_css/contactUs.css';
import '../../css/pages_css/reset.css';
import Header from '../../components/Header';
import Footer from '../../components/Footer';

const Contactus = (props) => {
    const [con, setCon] = useState({
        title: '',
        author:'',
        email:'',
        company: '',
        content:''
    });

    const changeValue = (e) => {
        e.preventDefault();
        setCon({
            ...con,
            [e.target.name]:e.target.value
        });
    }

    const submitCon = (e) => {
        e.preventDefault(); // submit이 action을 안타고 자기 할일을 그만함.
        fetch("http://localhost:9005/admin/contactUs",{
            method:"Post",
            headers:{
                "Content-Type":"application/json; charset=utf-8"
            },
            body:JSON.stringify(con)
        }).then(res=> {
            console.log("정상", res);
            if(res.status === 200){
                return res.json();
            } else{
                return null;
            }
            
        }).then(res=> {
            if(res !== null){
                props.history.push("/");
                alert("문의사항이 등록되었습니다.")
            } else{
                alert("문의사항 등록에 실패하였습니다.")
            }
        });
    }

    return (
        <div className='consultation'>
            <Header />
            <div className='raw'>
                <Row>
                    <Col md={{ span: 6, offset: 3 }}>
                        <h1 className='title contact_title'>문의답변</h1>
                        <hr className='line' />
                        <Form.Select aria-label="Default select example" id='select_color' className="select contact_select" name="">
                            <option>문의유형</option>
                            <option value="1">제휴 및 협업 문의</option>
                            <option value="2">광고 및 마케팅 문의</option>
                            <option value="3">기술 지원 및 개발 문의</option>
                            <option value="4">콘텐츠 제공 및 라이센싱 문의</option>
                            <option value="5">기타 문의</option>
                        </Form.Select>
                        <Form onSubmit={submitCon} >
                            <Form.Group className="mb-3 formSmall" controlId="exampleForm.ControlInput1">
                                <Form.Control type="text" name="company" className='contact_form' onChange={changeValue} placeholder="회사명을 입력하세요" />
                            </Form.Group>
                            <Form.Group className="mb-3 formSmall" controlId="exampleForm.ControlInput1">
                                <Form.Control type="text" name="email" className='contact_form' onChange={changeValue} placeholder="담당자 이메일을 입력하세요" />
                            </Form.Group>
                            <Form.Group className="mb-3 formSmall" controlId="exampleForm.ControlInput1">
                                <Form.Control type="text" name="author" className='contact_form' onChange={changeValue} placeholder="담당자 성함을 입력하세요" />
                            </Form.Group>
                            <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
                                <Form.Control type="text"name="title" className='contact_form' onChange={changeValue} placeholder="제목을 입력하세요" />
                            </Form.Group>
                            <Form.Group className="mb-3" controlId="exampleForm.ControlTextarea1">
                                <Form.Control as="textarea"name="content" className='contact_form' onChange={changeValue} rows={3} placeholder="문의사항을 입력하세요" />
                            </Form.Group>
                             <Form.Group controlId="formFile" className="mb-3 file" id="file" name="file">
                                <Form.Control type="file" />
                            </Form.Group>
                            <div className="textBox">
                                <Form.Check aria-label="option 1" className='agree_check' />
                                <p className="textHD">개인정보 수집 동의</p>
                                <span className="textContent">
                                    1. 수집하는 개인정보 항목 : 이름, 이메일 <br/><br/>
                                    2. 수입 목적 : 문의자 확인, 문의에 대한 회신 등의 처리 <br/><br/>
                                    3. 보유 기간 : 목적 달성 후 파기, 단, 관게법령에 따라 또는 회사 정책에 따른 정보보유사유가 발생하여 보존할 필요가 있는 경우에는 필요한 기간 동안 해당 정보를 보관합니다. 전자상거래 등에서의 소비자 보호에 관한 법류, 전자금융거래법, 통신비밀보호법 등 법령에서 일정기간 정보의 보관을 규정하는 경우, 이 기간 동안 법령의 규정에 따라 개인정보를 보관하며, 다른 목적으로는 절대 이용하지 않습니다.(개인정보처리방침 참고) <br/><br/>
                                    4. 귀하는 회사의 정보수집에 대해 동의하지 않거나 거부할 수 있습니다. 다만, 이때 원활한 문의 및 서비스 이용 등이 제한될 수 있습니다.
                                </span>
                            </div>

                            <div className="d-grid gap-2 contact_reg">
                                <Col md={{ span: 6, offset: 3 }}>
                                    <Button variant="primary" type="submit" size="lg" className="conButton contactBtn" >
                                        등록하기
                                    </Button>
                                </Col>
                            </div>
                        </Form>
                    </Col>
                </Row>
            </div>
            <Footer />
        </div>
    );
};

export default Contactus;