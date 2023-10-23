import React, { useState, useEffect } from "react";
import Image from "next/image";

//IMPORT INTERNAL
import Style from "./TokenChoice.module.css";
import images from "../../imagetotal";
import { Toggle } from "../index";

const TokenChoice = ({
  setOpenSetting,
  setSlippage,
  slippage,
  deadline,
  setDeadline,
}) => {
  return (
    <div className={Style.Token}>
      <div className={Style.Token_box}>
        <div className={Style.Token_box_heading}>
          <h4>Setting</h4>
          <div className={Style.Token_box_close}>
            <Image
              src={images.close}
              alt="close"
              width={50}
              height={50}
              onClick={() => setOpenSetting(false)}
            />
          </div>
        </div>
        <p className={Style.Token_box_para}>
          Slippage tolerance{""}
          <Image src={images.lock} alt="img" width={20} height={20} />
        </p>

        <div className={Style.Token_box_input}>
          <button>Auto</button>
          <input
            type="text"
            placeholder={slippage}
            onChange={(e) => setSlippage(e.target.value)}
          />
        </div>

        <p className={Style.Token_box_para}>
          Deatline Time{""}
          <Image src={images.lock} alt="img" width={20} height={20} />
        </p>

        <div className={Style.Token_box_input}>
          <input
            type="text"
            placeholder={deadline}
            onChange={(e) => setDeadline(e.target.value)}
          />
          <button>Minutes</button>
        </div>

        <h2>Interface Setting</h2>

        <div className={Style.Token_box_toggle}>
          <p className={Style.Token_box_para}>Transaction deadline</p>
          <Toggle label="No" />
        </div>
      </div>
    </div>
  );
};

export default TokenChoice;
